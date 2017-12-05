## Table of Contents

- [Ruby](#ruby)
- [Rails](#rails)
- [SCSS](#scss)
- [Javascript](#javascript)
- [Testing](#testing)
- [I18n](#i18n)
- [Database operations](#database-operations)
- [GitHub](#github)

## Ruby

- <a name="prefer-method-invocation"></a>
  Prefer method invocation over instance variables
  <sup>[link](#prefer-method-invocation)</sup>

  ```ruby
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
  ```

- <a name="avoid-using-ternary"></a>
  Avoid using ternary operator
  <sup>[link](#avoid-using-ternary)</sup>

  ```ruby
  ## Bad
  published? ? published_message : standard_message

  ## Good
  if published?
    published_message
  else
    standard_message
  end
  ```

- <a name="prefer-short-methods"></a>
  Prefer short, focused methods (aim for 1-liners, longer than 5 is a red flag)
  <sup>[link](#prefer-short-methods)</sup>

- <a name="prefer-small-classes"></a>
  Prefer small, focused classes (100+ lines is a red flag)
  <sup>[link](#prefer-small-classes)</sup>

- <a name="prefer-extracting-private"></a>
  Prefer extracting private methods over setting variables inside methods
  <sup>[link](#prefer-extracting-private)</sup>

  ```ruby
  ## Bad
  def method
    var_1 = # ...
    var_2 = # ...
    var_3 = # ...
    var_1 + var_2 + var_3
  end

  ## Good
  def method
    var_1 + var_2 + var_3
  end

    private

    def var_1
      # ...
    end

    def var_2
      # ...
    end

    def var_3
      # ...
    end
  ```

- <a name="prefer-dollars"></a>
  Prefer `$stdin`, `$stdout`, `$stderr` over `STDIN`, `STDOUT`, `STDERR`
  <sup>[link](prefer-dollars#)</sup>

- <a name="avoid-trailing-conditional"></a>
  Avoid lines that end with conditionals (exception is guard clauses)
  <sup>[link](#avoid-trailing-conditional)</sup>

  ```ruby
  ## Bad
  mark_related_items(:spam) if spam_detected?

  ## Good
  if spam_detected?
    mark_related_items(:spam)
  end

  ## OK for guard clauses, separate by space
  def approve
    return if approved?
    return if unapprovable?

    update(approved: true)
  end
  ```

## Rails

- <a name="prefer-time-current"></a>
  Prefer Time.current over Time.now, Date.current over Date.today
  <sup>[link](#prefer-time-current)</sup>

- <a name="extract-long-chains"></a>
  Extract long chains of unnamed conditions into named scopes or class methods
  <sup>[link](#extract-long-chains)</sup>

  ```ruby
  ## Bad
  def index
    @recipes = Recipe.where(published: true).where.not(approved_at: nil)
  end

  ## Good
  class Recipe
    scope :published, -> { where(published: true) }
    scope :approved, -> { where.not(approved_at: nil) }
    scope :live, -> { published.approved }
  end

  def index
    @recipes = Recipe.live
  end
  ```

- <a name="prefer-class-methods-over-scope"></a>
  Prefer class method over scope if the scope takes an argument or spans multiple lines
  <sup>[link](#prefer-class-methods-over-scope)</sup>

  ```ruby
  ## Bad
  class Recipe
    scope :published_on, -> (date) { where(published_on: date) }
  end

  ## Good
  class Recipe
    def self.published_on(date)
      where(published_on: date)
    end
  end

  ## Bad
  class Recipe
    scope :fresh, -> {
      recently_active.
        published(4.weeks.ago).
        popular.
        approved
    }
  end

  ## Good
  class Recipe
    def self.fresh
      recently_active.
        published(4.weeks.ago).
        popular.
        approved
    end
  end
  ```

- <a name="use-query-object"></a>
  Use a query object if a scope can be clarified by extracting private methods/needs additional state
  <sup>[link](#use-query-object)</sup>

  ```ruby
  ## Bad
  class Recipe
    def self.local
      radius_maximum = Config.radius_maximum
      distance = radius_maximum  / (Math::PI * 6371)
      where(distance: distance)
    end
  end

  ## Good
  class Recipe
    def self.local
      GeoSquareQuery.new(self).to_relation
    end
  end

  class GeoSquareQuery
    EARTH_RADIUS_IN_KM = 6371

    def initialize(relation)
      @relation = relation
    end

    def to_relation
      relation.where(distance: distance)
    end

    private

      attr_reader :relation

      def distance
        radius_maximum / (Math::PI * EARTH_RADIUS_IN_KM)
      end

      def radius_maximum
        Config.radius_maximum
      end
  end
  ```

- <a name="prefer-private-methods"></a>
  Prefer private methods over `before_action` to set instance variables
  <sup>[link](#prefer-private-methods)</sup>

  When setting context:

  ```ruby
  ## Bad
  class EntriesController < ApplicationController
    before_action :set_contest

    def index
      @entries = @contest.entries
    end

    private

      def set_contest
        @contest = Contest.find(params[:contest_id])
      end
  end

  ## Good
  class EntriesController < ApplicationController
    def index
      @entries = contest.entries
    end

    private

      def contest
        @_contest ||= Contest.find(params[:contest_id])
      end
  end
  ```

  When assiging vars to use in view:

  ```ruby
  ## Bad
  class EntriesController < ApplicationController
    before_action :set_entry

    def show
    end

    private

      def set_entry
        @entry = contest.entries.find(params[:id])
      end
  end

  ## Good
  class EntriesController < ApplicationController
    def show
      @entry = contest.entries.find(params[:id])
    end
  end

  ## If particular complicated/used more than once in the controller:
  class EntriesController < ApplicationController
    def show
      @entry = entry
    end

    def update
      @entry = entry
      if @entry.update(entry_params)
        redirect_to @entry
      else
        render :edit
      end
    end

    private

      def entry
        @_entry ||=  contest.entries.published.active.find(params[:id])
      end
  end
  ```

- <a name="prefer-private-methods"></a>
  Prefer private methods over `before_action` to set instance variables
  <sup>[link](#prefer-private-methods)</sup>

## Rake Tasks

- <a name="avoid-methods-inside-rake-namespace"></a>
  Avoid defining methods inside of Rake namespaces
  This will define methods at the top level and interfere with things like factories
  <sup>[link](#avoid-methods-inside-rake-namespace)</sup>

## SCSS

- <a name="use-bem"></a>
  Use [BEM & OOCSS](/best-practices/bem)
  <sup>[link](#use-bem)</sup>

- <a name="use-ui-specific"></a>
  Strive to use _UI-specific_ names rather than _business-specific_ names whenever possible (eg `.list-item` instead of `.recipe`)
  <sup>[link](#use-ui-specific)</sup>

- <a name="create-fully-formed"></a>
  Create meaningful and fully-formed modules. Ie don't add something called `margin_20` that adds 20px of margin!
  <sup>[link](#create-fully-formed)</sup>

- <a name="use-relative-font-sizes"></a>
  Use relative font-sizes (`em` and `rem`) as much as possible
  <sup>[link](#use-relative-font-sizes)</sup>

- <a name="use-rem"></a>
  When you really want something to have a specific size _no matter what the context_, use `rem`
  <sup>[link](#use-rem)</sup>

## Javascript

- <a name="avoid-using-classes-in-js"></a>
  Avoid using `.classes` as selectors (they are for styling). Use `[data-behavior~=]`, `[data-*]`, or `#ids`.
  <sup>[link](#avoid-using-classes-in-js)</sup>

## Testing

- <a name="prefer-explicitness"></a>
  Prefer explicitness in specs: Avoid using `subject`, `described_class`, `shared_examples`, `shared_context`
  <sup>[link](#prefer-explicitness)</sup>

- <a name="avoid-using-context"></a>
  Avoid using `context`
  <sup>[link](#avoid-using-context)</sup>

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

  If setup is kind of tedious, then we can introduce a helper method:

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

- <a name="avoid-using-let"></a>
  Avoid using `let`
  <sup>[link](#avoid-using-let)</sup>

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

- <a name="avoid-unused-dummy-data"></a>
  Avoid adding dummy data that is not asserted in the spec
  <sup>[link](#avoid-unused-dummy-data)</sup>

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

- <a name="only-enable-js-when-needed"></a>
  Only enable `:js` when the feature absolutely requires javascript
  <sup>[link](#only-enable-js-when-needed)</sup>

- <a name="prefer-have-text"></a>
  Prefer `have_text` over `have_content`
  <sup>[link](#prefer-have-text)</sup>

- <a name="prefer-descriptive-dummy-data"></a>
  Prefer "descriptive" dummy data over realistic dummy data
  <sup>[link](#prefer-descriptive-dummy-data)</sup>

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

- <a name="do-not-use-should"></a>
  Do not use _should_ when describing your tests
  <sup>[link](#do-not-use-should)</sup>

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

- <a name="avoid-assertions-on-classes"></a>
  Avoid assertions tied to html classes
  <sup>[link](#avoid-assertions-on-classes)</sup>

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

- <a name="use-actor-does-what"></a>
  Use `actor_does_what_spec.rb` naming convention for feature specs
  <sup>[link](#use-actor-does-what)</sup>

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

- <a name="prefer-multiple-short-specs"></a>
  Prefer multiple short & focused specs, over fewer long specs
  <sup>[link](#prefer-multiple-short-specs)</sup>

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

## I18n

- <a name="use-fully-qualified"></a>
  Use fully qualified name. eg. `recipes.show.title` rather than shorthand `.title`
  <sup>[link](#use-fully-qualified)</sup>

- <a name="scope-generic-phrases-under-common"></a>
  Scope _very_ generic phrases under `common.` eg. 'Delete' or 'Cookpad' are good candidates for common
  <sup>[link](#scope-generic-phrases-under-common)</sup>

- <a name="dont-abuse-zero-key"></a>
  Don't use `zero:` key to display a "no results" message (it is intended only to allow proper grammar)
  <sup>[link](#dont-abuse-zero-key)</sup>

## Database operations

- <a name="use-one-offs"></a>
  When _changing data_ in production, don't use the console. Instead _create a rake task_ and submit it for review.
  <sup>[link](#use-one-offs)</sup>

- <a name="dont-use-console"></a>
  When _reading data_ from production, avoid using the console, use redash instead.
  <sup>[link](#dont-use-console)</sup>

## GitHub

- <a name="use-merge-instead-of-rebase-when-collaborating"></a>
  When syncing with master, if the branch is under PR review or being collaborated on,
  use `merge` instead of `rebase` to avoid losing relevant context/breaking other local branches
  <sup>[link](#use-merge-instead-of-rebase-when-collaborating)</sup>

- <a name="dont-push-large-data"></a>
  Don't push temporary data files or big binary files to GitHub.
  <sup>[link](#dont-push-large-data)</sup>
