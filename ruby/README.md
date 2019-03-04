# Ruby

- <a name="prefer-method-invocation"></a>
  Prefer method invocation over instance variables
  <sup>[link](#prefer-method-invocation)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="avoid-using-ternary"></a>
  Avoid using ternary operator
  <sup>[link](#avoid-using-ternary)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="prefer-short-methods"></a>
  Prefer short, focused methods (aim for 1-liners, longer than 5 is a red flag)
  <sup>[link](#prefer-short-methods)</sup>

- <a name="avoid-bang-methods"></a>
  Avoid method names ending in `!` ("bang") without a corresponding bang-less, safe version of the method.
  <sup>[link](#avoid-bang-methods)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```ruby
    ## Bad
    def method!
      # dangerous operation, without any safe version (prima-donna)
    end

    ## Good
    def method
      # dangerous operation, without any safe version
    end

    ## Good
    def method
      # safe version
      # It’s conventional to define the non-bang method in terms of the bang one, i.e.
      dup.method!
    end

    def method!
      # dangerous operation, with a safe version
    end
    ```
  </details>

- <a name="prefer-small-classes"></a>
  Prefer small, focused classes (100+ lines is a red flag)
  <sup>[link](#prefer-small-classes)</sup>

- <a name="prefer-extracting-private"></a>
  Prefer extracting private methods over setting variables inside methods
  <sup>[link](#prefer-extracting-private)</sup>

  <details>
    <summary><em>Example</em></summary>

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
  </details>

- <a name="prefer-dollars"></a>
  Prefer `$stdin`, `$stdout`, `$stderr` over `STDIN`, `STDOUT`, `STDERR`
  <sup>[link](#prefer-dollars)</sup>

- <a name="avoid-trailing-conditional"></a>
  Avoid lines that end with conditionals (exception is guard clauses)
  <sup>[link](#avoid-trailing-conditional)</sup>

  <details>
    <summary>Example</summary>

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
  </details>

- <a name="explanatory-constants"></a>
  Describe unexplained strings/numbers using constants
  <sup>[link](#explanatory-constants)</sup>

  <details>
    <summary>Example</summary>

    ```ruby
    ## Bad
    def params
      { gak: "UA-4235" }
    end

    ## Good
    def params
      { gak: GOOGLE_ANALYTICS_KEY }
    end

    ## OK - string explained by hash key
    def params
      { google_analytics_key: "UA-4235" }
    end
    ```
  </details>

- <a name="dry-constants"></a>
  DRY multiple occurrences of values using constants
  <sup>[link](#dry-constants)</sup>

  <details>
    <summary>Example</summary>

    ```ruby
    ## Bad
    class Logger
      def log_params
        { google_analytics_key: "UA-4235" }
      end
    end

    class Tracker
      def config
        { google_analytics_key: "UA-4235" }
      end
    end

    ## Good
    class Logger
      def log_params
        { google_analytics_key: GoogleAnalytics::KEY }
      end
    end

    class Tracker
      def config
        { google_analytics_key: GoogleAnalytics::KEY }
      end
    end
    ```
  </details>

- <a name="separate-multiline-fetch-method"></a>
  Separate multiline fetch/query methods from the memoized method
  <sup>[link](#separate-multiline-fetch-method)</sup>

  <details>
    <summary>Example</summary>

    ```ruby
    ## Bad
    def pizza_recipes
      @_pizza_recipes ||= Recipe.
        published.
        in_current_language.
        where("title LIKE ?", "%pizza%")
    end

    ## Good
    def pizza_recipes
      @_pizza_recipes ||= fetch_pizza_recipes
    end

    def fetch_pizza_recipes
      Recipe.
        published.
        in_current_language.
        where("title LIKE ?", "%pizza%")
    end
    ```
  </details>
