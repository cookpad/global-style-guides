## Bad

class MarkRecipe
  def initialize(recipe)
    @recipe = recipe
  end

  def run
    @recipe.mark
  end
end

## Good

class MarkRecipe
  def initialize(recipe)
    @recipe = recipe
  end

  def run
    recipe.mark
  end

  private

    attr_reader :recipe
end
