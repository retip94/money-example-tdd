defmodule MoneyExampleTddTest do
  use ExUnit.Case

  test "multiplication" do
    dollar = %Dollar{amount: 5}
    assert Dollar.times(dollar, 2) == %Dollar{amount: 10}
    assert Dollar.times(dollar, 3) == %Dollar{amount: 15}
  end

  test "dollars equality" do
    assert %Dollar{amount: 5} == %Dollar{amount: 5}
  end

  test "franc multiplication" do
    franc = %Franc{amount: 5}
    assert Franc.times(franc, 2) == %Franc{amount: 10}
    assert Franc.times(franc, 3) == %Franc{amount: 15}
  end
end
