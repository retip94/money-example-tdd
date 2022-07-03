defmodule MoneyTest do
  use ExUnit.Case

  test "dollar multiplication" do
    dollar = %Dollar{amount: 5}
    assert Dollar.times(dollar, 2) == %Dollar{amount: 10}
    assert Dollar.times(dollar, 3) == %Dollar{amount: 15}
  end

  test "franc multiplication" do
    franc = %Franc{amount: 5}
    assert Franc.times(franc, 2) == %Franc{amount: 10}
    assert Franc.times(franc, 3) == %Franc{amount: 15}
  end

  test "equality" do
    assert Money.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    refute Money.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
    assert Money.equals(%Franc{amount: 5}, %Franc{amount: 5})
    refute Money.equals(%Franc{amount: 5}, %Franc{amount: 6})
  end
end
