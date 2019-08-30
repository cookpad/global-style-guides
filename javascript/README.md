# Javascript

- <a name="avoid-jquery"></a>
  Avoid using jQuery and jQuery plugins. Prefer solutions based on plain Javascript or Stimulus.
  <sup>[link](#avoid-jquery)</sup>
  <sup>[explanation](https://github.com/cookpad/global-web/issues/9333#issuecomment-434846695)</sup>

  <details>
    <summary><em>Example</em></summary>

    ```js
    // Bad
    $("#recipe")

    // Good
    document.getElementById("recipe")
    ```
  </details>

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
