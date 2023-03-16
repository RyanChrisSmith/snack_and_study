class RecipePoro
  attr_reader :title,
              :url,
              :image,
              :country

  def initialize(recipe_data, country)
    @title = recipe_data[:recipe][:label]
    @url = recipe_data[:recipe][:uri]
    @image = recipe_data[:recipe][:image]
    @country = country
  end
end