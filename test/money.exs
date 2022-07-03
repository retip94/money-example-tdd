defmodule MoneyTest do
  use ExUnit.Case

  test "multiplication" do
    dollar = Money.dollar(5)
    assert Money.times(dollar, 2) == %Money{amount: 10, currency: "USD"}
    assert Money.times(dollar, 3) == %Money{amount: 15, currency: "USD"}

    franc = Money.franc(5)
    assert Money.times(franc, 2) == %Money{amount: 10, currency: "CHF"}
    assert Money.times(franc, 3) == %Money{amount: 15, currency: "CHF"}
  end

  test "equality" do
    assert Money.equals(%Dollar{amount: 5}, %Dollar{amount: 5})
    refute Money.equals(%Dollar{amount: 5}, %Dollar{amount: 6})
    assert Money.equals(%Franc{amount: 5}, %Franc{amount: 5})
    refute Money.equals(%Franc{amount: 5}, %Franc{amount: 6})
    refute Money.equals(%Dollar{amount: 5}, %Franc{amount: 5})
  end

  test "currency" do
    assert Money.dollar(1).currency == "USD"
    assert Money.franc(1).currency == "CHF"
  end
end
