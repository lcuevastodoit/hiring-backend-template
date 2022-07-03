class Person
  attr_reader :first_name, :city, :birthdate

  def initialize(first_name:, city:, birthdate:)
    @first_name = first_name
    @city = city
    @birthdate = birthdate
  end

  def create_person
    validates_city
    validates_birthdate
    self
  end

  private

  def validates_city
    @city = Values::CITY_ACRONYMS[@city] if Values::CITY_ACRONYMS.key?(@city)
  end

  def validates_birthdate
    if @birthdate.match?(Values::DMY)
      @birthdate = Date.strptime(@birthdate, '%d-%m-%Y').strftime(Values::DATE_FORMAT)
    elsif @birthdate.match?(Values::YMD)
      @birthdate = Date.strptime(@birthdate, '%Y-%m-%d').strftime(Values::DATE_FORMAT)
    else
      raise ArgumentError, 'Invalid date format'
    end
  end
end
