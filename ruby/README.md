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

- <a name="memoized-instance-variable-name"></a>
  In memoized methods, use an instance variable that matches the method name prefixed with an underscore
  <sup>[link](#memoized-instance-variable-name)</sup>

  <details>
    <summary>Example</summary>

    ```ruby
    ## Bad
    def author
      @_user ||= User.find(params[:id])
    end

    ## Bad
    def author
      @author ||= User.find(params[:id])
    end

    ## Good
    def author
      @_author ||= User.find(params[:id])
    end
    ```
  </details>

