## Bad
let(:recipe) { create(:recipe) }

it "does something" do
end

it "does something" do
end

it "does something" do
end

it "does something" do
end

it "spec faaaar down the page" do
  recipe.publish # huh? where does this recipe come from?
end

## Good
it "does something" do
  recipe = create(:recipe)
  recipe.publish
end
