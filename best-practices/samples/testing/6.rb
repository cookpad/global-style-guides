## Bad
create_list(3, :recipe)
visit recipes_path
expect(page).to have_css(".recipe", count: 3)

## Good
create_list(3, :recipe, title: "Recipe Title")
visit recipes_path
expect(page).to have_text("Recipe Title", count: 3)


## Bad
within(".user-info") do
  click_link("Edit")
end

## Better
within("#user_info") do
  click_link("Edit")
end

## Best
click_link("Edit User Info") # f.ex using unambiguous title="Edit User Info" or aria-label="Edit User Info" attribute
