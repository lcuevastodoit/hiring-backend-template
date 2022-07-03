class DataParserService < ApplicationService
  def initialize(data, separator)
    @data = data
    @separator = separator
  end

  def call
    parse_data
    parsed_data_to_object
  end

  private

  def parsed_data_to_object
    @parsed_data.map do |row|
      Person.new(first_name: row['first_name'], city: row['city'], birthdate: row['birthdate'])
        .create_person
    end
  end

  def parse_data
    @parsed_data = CSV.parse(@data, headers: true, col_sep: @separator)
  end
end
