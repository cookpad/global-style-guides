## Bad
alice = create(:user, name: "Alice")
alice.friends << create(:user, name: "Bob")
create(:user, name: "Mary")

visit friends_path(alice)
expect(page).to have_text("Bob")
expect(page).to_not have_text("Mary") # Who is Bob/Mary and how are they related again?

## Good
user = create(:user)
user.friends << create(:user, name: "Friend of User")
create(:user, name: "Not Friend of User")

visit friends_path(user)
expect(page).to have_text("Friend of User")
expect(page).to_not have_text("Not Friend of User")
