defmodule MoneyExampleTddTest do
  use ExUnit.Case
  doctest MoneyExampleTdd

  test "test multiplication" do
    dollar = %Dollar{amount: 5}
    assert Dollar.times(dollar, 2) == %Dollar{amount: 10}
  end

  test "test dollars equality" do
    assert %Dollar{amount: 5} == %Dollar{amount: 5}
  end
end
