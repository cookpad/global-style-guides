 # JavaScript

 - <a name="use-prettier"></a>
  Use [Prettier](https://prettier.io) to format javascript code.
  <sup>[link](#use-prettier)</sup>

- <a name="avoid-jquery"></a>
  Avoid using jQuery and jQuery plugins. Prefer solutions based on plain JavaScript or Stimulus.
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

- <a name="leverage-progressive-enhancement"></a>
  Leverage progressive enhancement as a development approach.
  <sup>[link](#leverage-progressive-enhancement) [explanation](https://sourcediving.com/progressive-enhancement-as-a-valuable-philosophy-in-the-age-of-javascript-aac2e26364d2)</sup>
