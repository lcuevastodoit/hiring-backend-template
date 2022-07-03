class PeopleController
  def initialize(params)
    @dollar_format_data = params[:dollar_format]
    @percent_format_data = params[:percent_format]
    @order = params[:order]
  end

  def normalize
    people_array = DataParserService.call(@percent_format_data, ' % ')
    people_array += DataParserService.call(@dollar_format_data, ' $ ')
    people_array.sort! { |a, b| a.send(@order) <=> b.send(@order) }
    people_array.map { |person| "#{person.first_name}, #{person.city}, #{person.birthdate}" }
  end
end
