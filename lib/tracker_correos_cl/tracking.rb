module TrackerCorreosCl
  class Tracking
    attr_reader :status, :date, :office

    def initialize(status, date, office)
      @status = status
      @date = date
      @office = office
    end
  end
end
