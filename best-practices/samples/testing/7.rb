## Bad

# /features/recipes_spec.rb
feature "Recipes" do
  scenario "Author viewing own recipe shows welcome message" do
    # ...
  end

  scenario "Author has already seen welcome message" do
    # ...
  end
end

## Good

# /features/author_views_recipe_spec.rb
feature "Author views recipe" do
  scenario "Shows welcome message" do
    # ...
  end

  scenario "Already seen welcome message" do
    # ...
  end
end
