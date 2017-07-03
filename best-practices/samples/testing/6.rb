## Bad
create_list(3, :recipe)
visit recipes_path
expect(page).to have_css(".recipe", count: 3)

## Good
create_list(3, :recipe, title: "Recipe Title")
visit recipes_path
expect(page).to have_text("Recipe Title", count: 3)


## Bad
within(".android-download-banner") do
  expect(page).to have_text("Download Here")
end

## Good
within("#android_download_banner") do
  expect(page).to have_text("Download Here")
end
