# Testing

- <a name="avoid-subject-and-friends"></a>
  Avoid using `subject`, `described_class`, `shared_examples`, `shared_context`
  <sup>[link](#avoid-subject-and-friends)</sup>

- <a name="avoid-using-context"></a>
  Avoid using `context`
  <sup>[link](#avoid-using-context)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    context "when condition A" do
      before do
        # setup for condition A
      end

      it "does something a" do
        # ...
      end

      it "does something b" do
        # ...
      end

      context "and another condition B" do
        before do
          # setup for condition B
        end

        it "does something c" do
          # ...where am I? What setup has been done?
        end
      end
    end

    ## Good
    it "does something a when condition A" do
      # setup for condition A
      # expect a
    end

    it "does something b when condition A" do
      # setup for condition A
      # expect b
    end

    it "does something c when condition A and condition B" do
      # setup for condition A
      # setup for condition B
      # expect c
    end
    ```

    If setup is tedious, then we can introduce a helper method:

    ```ruby
    it "does something a when condition A" do
      setup_condition_a
      # expect a
    end

    it "does something b when condition A" do
      setup_condition_a
      # expect b
    end

    private

      def setup_condition_A
        # ...
      end
    ```
  </details>

- <a name="avoid-using-let"></a>
  Avoid using `let`
  <sup>[link](#avoid-using-let)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
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
    ```
  </details>

- <a name="avoid-unused-dummy-data"></a>
  Avoid adding dummy data that is not asserted in the spec
  <sup>[link](#avoid-unused-dummy-data)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    user = create(:user, name: "Name", profile_message: "Not Asserted")
    login(user)
    expect(page).to have_text("Name")

    ## Good
    user = create(:user, name: "Name")
    login(user)
    expect(page).to have_text("Name")
    ```
  </details>

- <a name="only-enable-js-when-needed"></a>
  Only enable `:js` when the feature absolutely requires javascript
  <sup>[link](#only-enable-js-when-needed)</sup>

- <a name="prefer-have-text"></a>
  Prefer `have_text` over `have_content`
  <sup>[link](#prefer-have-text)</sup>

- <a name="prefer-descriptive-dummy-data"></a>
  Prefer "descriptive" dummy data over realistic dummy data
  <sup>[link](#prefer-descriptive-dummy-data)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
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
    ```
  </details>

- <a name="do-not-use-should"></a>
  Do not use _should_ when describing your tests
  <sup>[link](#do-not-use-should)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad

    it "should deliver email" do
    end

    it "should not deliver email when user prints a recipe" do
    end

    it "should only send email that has been activated" do
    end

    it "should be enabled" do
    end

    it "should have custom headers" do
    end

    it "should by default be true" do
    end

    ## Good

    it "delivers email" do
    end

    it "does not deliver email when user prints a recipe" do
    end

    it "only sends email that has been activated" do
    end

    it "is enabled" do
    end

    it "has custom headers" do
    end

    it "defaults to true" do
    end
    ```
  </details>

- <a name="avoid-assertions-on-classes"></a>
  Avoid assertions tied to html classes
  <sup>[link](#avoid-assertions-on-classes)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
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
    ```
  </details>

- <a name="use-actor-does-what"></a>
  Use `actor_does_what_spec.rb` naming convention for feature specs
  <sup>[link](#use-actor-does-what)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
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
    ```
  </details>

- <a name="prefer-multiple-short-specs"></a>
  Prefer multiple short & focused specs, over fewer long specs
  <sup>[link](#prefer-multiple-short-specs)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
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
    ```
  </details>

- <a name="use-i18n"></a>
  Use I18n helpers when clicking/asserting
  <sup>[link](#use-i18n)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    click_link "Sign up"
    expect(page).to have_text("Welcome!")

    ## Good
    click_link t("signups.new.signup_button")
    expect(page).to have_text t("signups.create.welcome_message")
    ```
  </details>

- <a name="use-minutes"></a>
  Use minutes instead of seconds when setting timestamps for the purpose of asserting the order of results
  <sup>[link](#use-minutes)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad: Causes random failures depending on the timing of each step
    older_recipe = create(:recipe, published_at: 2.seconds.ago)
    newest_recipe = create(:recipe, published_at: 1.second.ago)

    expect(Recipe.recently_published.first).to eq(newest_recipe)
    expect(Recipe.recently_published.last).to eq(older_recipe)

    ## Good
    older_recipe = create(:recipe, published_at: 2.minutes.ago)
    newest_recipe = create(:recipe, published_at: 1.minute.ago)

    expect(Recipe.recently_published.first).to eq(newest_recipe)
    expect(Recipe.recently_published.last).to eq(older_recipe)
    ```
  </details>
  
  - <a name="use-minutes"></a>
  Prefer splitting up longer specs into tinier ones, even if they require the same setup
  <sup>[link](#use-minutes)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    it "sanitizes recipe titles" do
      recipe = build(:recipe, title: "recipe title without capital letter")
      expect(recipe.title).to eq("Recipe title without capital letter")
    
      recipe = build(:recipe, title: "Recipe title with period Brand Name v1.0. ")
      expect(recipe.title).to eq("Recipe title with period Brand Name v1.0")

      recipe = build(:recipe, title: "Recipe title ( very good   )")
      expect(recipe.title).to eq("Recipe title (very good)")

      recipe = build(:recipe, title: 'Recipe title " very good   "')
      expect(recipe.title).to eq('Recipe title "very good"')
    end

    ## Good
    it "capitalizes the first letter in recipe titles" do
      recipe = build(:recipe, title: "recipe title without capital letter")
      expect(recipe.title).to eq("Recipe title without capital letter")
    end
    
    it "removes full stop from recipe titles" do
      recipe = build(:recipe, title: "Recipe title with period Brand Name v1.0. ")
      expect(recipe.title).to eq("Recipe title with period Brand Name v1.0")
    end
    
    it "removes spaces inside parens from recipe titles" do
      recipe = build(:recipe, title: "Recipe title ( very good   )")
      expect(recipe.title).to eq("Recipe title (very good)")
    end

    it "removes spaces inside quotes from recipe titles" do
      recipe = build(:recipe, title: 'Recipe title " very good   "')
      expect(recipe.title).to eq('Recipe title "very good"')
    end
    ```
  </details>
