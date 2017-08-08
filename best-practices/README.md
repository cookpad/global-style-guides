## Ruby

- [Prefer method invocation over instance variables](samples/ruby/1.rb)
- [Avoid using ternary operator](samples/ruby/2.rb)
- Prefer short, focused methods (aim for 1-liners, longer than 5 is a red flag)
- Prefer small, focused classes (100+ lines is a red flag)

## Rails

- Prefer `Time.current` over `Time.now`
- Prefer `Date.current` over `Date.today`
- [Prefer extracting private methods over setting variables inside methods](samples/rails/1.rb)
- [Extract long chains of unnamed conditions into named scopes or class methods](samples/rails/2.rb)
- [Prefer class method over scope if the scope takes an argument or spans multiple lines](samples/rails/5.rb)
- [Use a query object if a scope can be clarified by extracting private methods/needs additional state](samples/rails/3.rb)
- [Prefer private methods over `before_action` to set instance variables](samples/rails/4.rb)

## Rake Tasks

- Avoid defining methods inside of Rake namespaces since this will define methods at the top level and interfere with things like factories

## SCSS

- Use [BEM & OOCSS](/best-practices/bem)
- Strive to use _UI-specific_ names rather than _business-specific_ names whenever possible (eg `.list-item` instead of `.recipe`)
- Create meaningful and fully-formed modules. Ie don't add something called `margin_20` that adds 20px of margin!
- Use relative font-sizes (`em` and `rem`) as much as possible
- When you really want something to have a specific size _no matter what the context_, use `rem`

## Javascript

- Avoid using `.classes` as selectors (they are for styling). Use `[data-behavior~=]`, `[data-*]`, or `#ids`.

## Testing

- Prefer explicitness in specs: Avoid using `subject`, `described_class`, `shared_examples`, `shared_context`
- [Avoid using `context`](samples/testing/1.rb)
- [Avoid using `let`](samples/testing/3.rb)
- [Avoid adding dummy data that is not asserted in the spec](samples/testing/2.rb)
- Only enable `:js` when the feature absolutely requires javascript
- [Prefer `have_text` over `have_content`](https://groups.google.com/forum/#!topic/ruby-capybara/NH4HHEm7400)
- [Prefer "descriptive" dummy data over realistic dummy data](samples/testing/4.rb)
- [Do not use _should_ when describing your tests](samples/testing/5.rb)
- [Avoid assertions tied to html classes](samples/testing/6.rb)

## I18n

- Use fully qualified name. eg. `recipes.show.title` rather than shorthand `.title`
- Scope _very_ generic phrases under `common.` eg. 'Delete' or 'Cookpad' are good candidates for common
- Don't use `zero:` key to display a "no results" message (it is intended only to allow proper grammar)

## Database operations

- When _changing data_ in production, don't use the console. Instead _create a rake task_ and submit it for review.
- When _reading data_ from production, always use the _sandbox_ console: `bundle exec rails c -s production`

## GitHub

- When syncing with master, if the branch is under PR review or being collaborated on,
  use `merge` instead of `rebase` to avoid losing relevant context/breaking other local branches
- Avoid pushing temporary data files or big binary files to GitHub.
