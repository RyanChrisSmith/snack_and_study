class RecipesService

  def self.find_recipes(country)
    response = conn.get('/api/recipes/v2?') do |req|
      req.params['q'] = "#{country}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['type'] = 'public'
      f.params['app_id'] = ENV['recipe_id']
      f.params['app_key'] = ENV['recipe_key']
    end
  end
end