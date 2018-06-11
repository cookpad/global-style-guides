# Javascript

- <a name="avoid-using-classes-in-js"></a>
  Avoid using `.classes` as selectors (they are for styling). Use `[data-behavior~=]`, `[data-*]`, or `#ids`.
  <sup>[link](#avoid-using-classes-in-js)</sup>

- <a name="use-camelcase-in-js"></a>
  Use `camelCase`, not `snake_case` in Javascript
  <sup>[link](#use-camelcase-in-js)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```js
    // Bad
    let recipe_link = event.currentTarget

    // Good
    let recipeLink = event.currentTarget
    ```
  </details>
