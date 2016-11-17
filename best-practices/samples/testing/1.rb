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
      # ...
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

# If condition A is kind of tedious, then we can introduce a helper method
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
