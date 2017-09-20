## Bad
scenario "Bookmarking and unbookmarking a recipe" do
  recipe = create(:recipe)

  visit recipe_path(recipe)
  click_link t("recipes.show.bookmark_link")

  expect(page).to have_text(t("bookmarks.bookmarked"))

  click_link t("recipes.show.unbookmark_link")

  expect(page).to have_text(t("bookmarks.unbookmarked"))
end

## Good
scenario "Bookmarking a recipe" do
  recipe = create(:recipe)

  visit recipe_path(recipe)
  click_link t("recipes.show.bookmark_link")

  expect(page).to have_text(t("bookmarks.bookmarked"))
end

scenario "Unbookmarking a recipe" do
  bookmark = create(:bookmark)

  visit recipe_path(bookmark.recipe)
  click_link t("recipes.show.unbookmark_link")

  expect(page).to have_text(t("bookmarks.unbookmarked"))
end
