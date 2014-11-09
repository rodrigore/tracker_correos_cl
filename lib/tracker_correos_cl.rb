require 'nokogiri'
require 'net/http'
require "tracker_correos_cl/version"
require "tracker_correos_cl/delivery"
require "tracker_correos_cl/tracking"

module TrackerCorreosCl
  class Tracker
    BASE_URL = "http://courier.correos.cl/seguimientoweb/detalle_envio.aspx?envio="

    attr_reader :delivery, :tracking_collection

    def initialize(tracking_number)
      @valid_number = true
      parse( fetch(BASE_URL + tracking_number) )
    end

    def valid?
      @valid_number
    end

    private

    def fetch(url)
      uri = URI(url)
      Net::HTTP.get(uri)
      # raise "Error al conectar con el servidor" unless response.kind_of? Net::HTTPSuccess
      rescue Exception
        raise "Error al conectar con el servidor"
    end

    def parse(html)
      doc = Nokogiri::HTML(html)
      if parse_wrong_tracking_number(doc)
        @valid_number = false
      else
        @delivery = parse_delivery_information(doc)
        @tracking_collection = parse_tracking_information(doc)
      end
    end

    def parse_wrong_tracking_number(doc)
      doc.at_css('#pnlError')
    end

    def parse_delivery_information(doc)
      table_delivery = doc.search('#Panel_Entrega')
      if table_delivery
        data = table_delivery.css('tr > td:nth-child(even)').collect {|d| d.text.strip}
        Delivery.new(data[0], data[1], data[2], data[3])
      end
    end

    def parse_tracking_information(doc)
      tracking_collection =  []
      doc.search('.tracking').css('tr:not(:first-child)').each do |row|
        tracking = row.css('td').collect {|d| d.text.strip}
        tracking_collection << Tracking.new(tracking[0], tracking[1], tracking[2])
      end
      tracking_collection
    end
  end

end
