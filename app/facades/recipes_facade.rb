class RecipesFacade

  def self.get_all_recipes(country)
    recipes = RecipesService.find_recipes(country)
    collect_recipes(recipes, country)
  end

  def self.collect_recipes(recipes, country)
    recipes[:hits].map do |recipe_data|
      RecipePoro.new(recipe_data, country)
    end
  end
end