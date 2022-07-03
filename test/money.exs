defmodule MoneyTest do
  use ExUnit.Case

  test "multiplication" do
    dollar = Money.dollar(5)
    assert Money.times(dollar, 2) == %Dollar{amount: 10}
    assert Money.times(dollar, 3) == %Dollar{amount: 15}

    franc = Money.franc(5)
    assert Money.times(franc, 2) == %Franc{amount: 10}
    assert Money.times(franc, 3) == %Franc{amount: 15}
  end

  test "equality" do
    assert Money.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    refute Money.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
    assert Money.equals(%Franc{amount: 5}, %Franc{amount: 5})
    refute Money.equals(%Franc{amount: 5}, %Franc{amount: 6})
    refute Money.equals(%Dollar{amount: 5}, %Franc{amount: 5})
  end
end
