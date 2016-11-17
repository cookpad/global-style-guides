## Bad
user = create(:user, name: "Name", profile_message: "Not Asserted")
login(user)
expect(page).to have_content("Name")

## Good
user = create(:user, name: "Name")
login(user)
expect(page).to have_content("Name")
