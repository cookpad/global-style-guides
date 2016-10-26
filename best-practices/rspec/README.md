# RSpec Style Guides

## Encourage plain ruby over RSpec "magic"

- Should not use `subject`, `specify`, `described_class`, `shared_examples`, `shared_context`, etc
- `let`, `context` can be exceptional but prefer plain ruby methods whenever possible

Why? It tends to DRY things too much that makes you feel good when _writing_ it, but not when _reading_ it, including future you and other developers. Quote Sandi Metz: "Code is read many more times that it is written, and computers are fast.", it's especially true for test code.

We care more about a self contained spec, that can tell you exactly what's the setup, performed action and expected outcome. Keep in mind that duplication in test suites is NOT frowned upon, in fact it is preferred if it provides easier understanding and reading of a test.

### Not Encouraged Example

Thorough explanation of why it's _potentially_ bad: https://github.com/cookpad/global-web/pull/3820#discussion_r82322910

```ruby
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
    let(:foo) { ... } # assume he likes `let` syntax

    before do
      # setup for condition B
    end

    it "does something c" do
      # ...
    end
  end
end
```

### Encouraged Example

```ruby
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
  # foo = ...
  # expect c
end
```

Another [bad example](https://github.com/cookpad/global/blob/9dbb0d55cc413a639989622af02ea776d05dfe40/spec/requests/recipes_spec.rb#L190-L197) (not meant to insult anyone) of over-DRYed test code, you can't tell what's the setup part and what's being asserted exactly unless you _debug_ your test code.

```ruby
describe "GET /recipes" do
  # some more setup...

  context "with one recipe" do
    before do
      recipe
    end

    it "returns all existent recipes" do
      should == 200
      response.body.should be_json_as(result: [Hash], extra: Hash)
    end
  end
end
```

Further reading on this subject:

- https://global.g.cookpad.com/qihuan-piao/20160512/171541
- http://kinopyo.com/en/blog/notes-on-let-s-make-testing-fun-again

## Minimum amount of fixture setup

If we don't need to check something for the spec, then we don't need to add noise and code setting it.

```ruby
# Bad: Profile is not used
user = create(:user, name: "Name", profile_message: "Not Gonna Be Asserted")
login(user)
expect(page).to have_content("Name")

# Good
user = create(:user, name: "Name")
login(user)
expect(page).to have_content("Name")
```

## JS specs are slow

Only enable JS when your tests require it. Enabling JS slows down your test suite.

Unless the pages you are testing require JS, it's best to disable JS after you're done writing the test so that the test suite runs faster.

## Other Tips

- Use [TimeCop](https://github.com/travisjeffery/timecop) to mock and test methods that relies on time.
- Use [Webmock](https://github.com/bblimke/webmock) to mock HTTP calls to remote service that could not be available all the time and that you want to personalize.
- Use [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation) to write API specs, it'll generate api docs automatically.
