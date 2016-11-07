## SCSS

- Use [BEM & OOCSS](/best-practices/bem)
- Strive to use _UI-specific_ names rather than _business-specific_ names whenever possible (eg `.list-item` instead of `.recipe`)
- Create meaningful and fully-formed modules. Ie don't add something called `margin_20` that adds 20px of margin!
- Use relative font-sizes (`em` and `rem`) as much as possible
- When you really want something to have a specific size _no matter what the context_, use `rem`

## Javascript

- Avoid using `.classes` as selectors (they are for styling). Use `[data-behavior~=]`, `[data-*]`, or `#ids`.

## Test

- [RSpec Style Guides](/best-practices/rspec)

## I18n

- Use fully qualified name. eg. `recipes.show.title` rather than shorthand `.title`
- Scope _very_ generic phrases under `common.` eg. 'Delete' or 'Cookpad' are good candidates for common
- Don't use `zero:` key to display a "no results" message (it is intended only to allow proper grammar)

## Database operations

- When _changing data_ in production, don't use the console. Instead _create a rake task_ and submit it for review.
- When _reading data_ from production, always use the _sandbox_ console: `bundle exec rails c -s production`
