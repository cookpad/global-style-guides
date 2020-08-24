# Rails

- <a name="prefer-time-current"></a>
  Prefer Time.current over Time.now, Date.current over Date.today
  <sup>[link](#prefer-time-current)</sup>

- <a name="extract-long-chains"></a>
  Extract long chains of unnamed conditions into named scopes or class methods
  <sup>[link](#extract-long-chains)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="prefer-class-methods-over-scope"></a>
  Prefer class method over scope if the scope takes an argument or spans multiple lines
  <sup>[link](#prefer-class-methods-over-scope)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="use-query-object"></a>
  Use a query object if a scope can be clarified by extracting private methods/needs additional state
  <sup>[link](#use-query-object)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="prefer-private-methods"></a>
  Prefer private methods over `before_action` to set instance variables
  <sup>[link](#prefer-private-methods) [explanation](http://craftingruby.com/posts/2015/05/31/dont-use-before-action-to-load-data.html)</sup>

  <details>
    <summary><em>Example (when setting context)</em></summary>

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
  </details>

  <details>
    <summary><em>Example (when assiging vars to use in view)</em></summary>

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
    ```
  </details>

  <details>
    <summary><em>Example (when particular complicated/used more than once in the controller)</em></summary>

    ```ruby
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
  </details>

- <a name="prefer-rest-verbs"></a>
  Prefer adding new controllers with RESTful actions over using custom actions
  <sup>[link](#prefer-rest-verbs) [explanation](http://jeromedalbert.com/how-dhh-organizes-his-rails-controllers/)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    class UserController < ApplicationController
      def ban
        user.ban
      end

      def unban
        user.unban
      end
    end

    ## Good
    class BansController < ApplicationController
      def create
        user.ban
      end

      def destroy
        user.unban
      end
    end
    ```
  </details>

- <a name="use-fully-qualified"></a>
  Use fully qualified i18n name. eg. `recipes.show.title` rather than shorthand `.title`
  <sup>[link](#use-fully-qualified)</sup>

- <a name="scope-generic-phrases-under-common"></a>
  Scope _very_ generic i18n phrases under `common.` eg. 'Delete' or 'Cookpad' are good candidates for common
  <sup>[link](#scope-generic-phrases-under-common)</sup>

- <a name="dont-abuse-zero-key"></a>
  Don't use i18n `zero:` key to display a "no results" message.
  <sup>[link](#dont-abuse-zero-key)</sup>
  <details>
    <summary><em>Example</em></summary>
    
    ```yml
    # Pluralization rules vary from language to language and keys are automatically added and 
    # removed from the translation files. So the `zero:` key cannot be relied on to be present 
    # for every language. 
    # 
    # Use a separate key for the "no results" message instead.
    #
    # Bad
    search_results:
      zero: "There were no results"
      one: "1 recipe found"
      other: "%{count} recipes found"
 
    # Good
    search_results:
      one: "1 recipe found"
      other: "%{count} recipes found"
    search_no_results: "There were no results"
    ``` 
  </details>

- <a name="dont-html-in-locale"></a>
  Don't include HTML in locale file
  <sup>[link](#dont-html-in-locale)
  [explanation](https://sourcediving.com/rails-i18n-handling-formatting-within-translated-content-e45f4d6cf63d)</sup>
  <details>
    <summary><em>Example</em></summary>

    ### Bad
    ```yml
    current_time_html: "<strong>Current time:</strong> %{time}"
    ```

    ```erb
    <%= t("current_time_html", time: Time.current) %>
    ```

    ### Good
    ```yml
    current_time:
      label: "Current time:"
      label_time_html: "%{label} %{time}"
    ```

    ```erb
    <%= t("current_time.label_time_html", label: content_tag(:strong, t("current_time.label")), time: Time.current) %>
    ```
  </details>

- <a name="service-object-method"></a>
  Service objects should have a single public method `#run`, which does not accept arguments
  <sup>[link](#service-object-method)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    class ChatMessage
      def run(chat:, :body)
        chat.messages.create(body: body)
      end
    end

    ## Good
    class ChatMessage
      def initialize(chat:, body:)
        @chat = chat
        @body = body
      end

      def run
        chat.messages.create(body: body)
      end

      private
        attr_reader :chat, :body
    end
    ```
  </details>

- <a name="service-object-return"></a>
  If a service object needs to return a value, prefer a meaningful object, e.g. an invalid model over false
  <sup>[link](#service-object-return)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    def run
      message = chat.messages.new(body: body)
      message.save # true/false
    end

    ## Good
    def run
      message = chat.messages.new(body: body)
      message.save
      message
    end
    ```
  </details>

- <a name="prefer-local-variables-in-partials"></a>
  Prefer local variables for a partial over instance variables
  <sup>[link](#prefer-local-variables-in-partials)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```erb
    <!-- Bad -->

    <!-- app/views/users/show.html.erb -->
    <%= render "users/follows_count" %>

    <!-- app/views/users/_follows_count.html.erb -->
    <div>
      <strong><%= @user.name %></strong><br>
      <span><%= @user.followers.size %> Followers</span>
      <span><%= @user.followees.size %> Following</span>
    </div>

    <!-- Good -->

    <!-- app/views/users/show.html.erb -->
    <%= render "users/follows_count", user: @user %>

    <!-- app/views/users/_follows_count.html.erb -->
    <div>
      <strong><%= user.name %></strong><br>
      <span><%= user.followers.size %> Followers</span>
      <span><%= user.followees.size %> Following</span>
    </div>
    ```
  </details>

- <a name="consistent-erb-indent"></a>
  Follow consistent ERB indent style
  <sup>[link](#consistent-erb-indent)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```erb
    <!-- Bad -->

      <!-- ERB tag opener/closer on its own line -->

        <%= render "accounts/header",
              left_navigation: link_to(...),
              dismissable: true
        %>

        <%=
          render "accounts/header",
            left_navigation: link_to(...),
            dismissable: true
        %>

      <!-- Wrong indentation for lines after first inside ERB tag -->

        <%= render "accounts/header",
            left_navigation: link_to(...),
            dismissable: true %>

    <!-- Good -->

      <%= render "accounts/header",
            left_navigation: link_to(...),
            dismissable: true %>
    ```

- <a name="leverage-top-down"></a>
  Leverage top-down development and feature toggles to keep pull requests small.
  <sup>[link](#leverage-top-down)
[explanation](https://sourcediving.com/a-practical-guide-to-small-and-easy-to-review-pull-requests-a7f04a01d5d5)</sup>
