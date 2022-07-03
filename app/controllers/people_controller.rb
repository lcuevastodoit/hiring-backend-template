class PeopleController
  def initialize(params)
    @dollar_format = params[:dollar_format]
    @percent_format = params[:percent_format]
    @order = params[:order]
  end

  def normalize
    [
      'Elliot, New York City, 5/4/1947',
      'Mckayla, Atlanta, 5/29/1986',
      'Rhiannon, Los Angeles, 4/30/1974',
      'Rigoberto, New York City, 1/5/1962'
    ]
  end

  private

  attr_reader :params
end
