defmodule MoneyExampleTddTest do
  use ExUnit.Case
  doctest MoneyExampleTdd

  test "test multiplication" do
    dollar = %Dollar{amount: 5}
    assert Dollar.times(dollar, 2) == %Dollar{amount: 10}
  end
end
