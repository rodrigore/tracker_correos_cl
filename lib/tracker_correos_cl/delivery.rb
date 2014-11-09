module TrackerCorreosCl
  class Delivery
    attr_reader :number, :to, :rut, :date

    def initialize(number, to, date, rut)
      @number = number
      @to = to
      @date = date
      @rut = rut
    end

    def to_s
      "number #{number}, to #{to}, rut #{rut}, date #{date}"
    end

  end
end
