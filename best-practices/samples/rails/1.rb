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

