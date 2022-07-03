defmodule MoneyTest do
  use ExUnit.Case

  test "multiplication" do
    dollar = Money.dollar(5)
    assert Money.multiply(dollar, 2) == %Money{amount: 10, currency: "USD"}
    assert Money.multiply(dollar, 3) == %Money{amount: 15, currency: "USD"}

    franc = Money.franc(5)
    assert Money.multiply(franc, 2) == %Money{amount: 10, currency: "CHF"}
    assert Money.multiply(franc, 3) == %Money{amount: 15, currency: "CHF"}
  end

  test "sum" do
    sum = Money.sum(Money.dollar(5), Money.dollar(5))
    reduced = Bank.reduce(sum, "USD")
    assert reduced == Money.dollar(10)
  end

  test "equality" do
    assert Money.equals(Money.dollar(5), Money.dollar(5))
    refute Money.equals(Money.dollar(5), Money.dollar(6))
    refute Money.equals(Money.dollar(5), Money.franc(5))
  end

  test "currency" do
    assert Money.dollar(1).currency == "USD"
    assert Money.franc(1).currency == "CHF"
  end

  test "reduce sum" do
    sum = %Sum{augend: Money.dollar(3), addend: Money.dollar(4)}
    result = Bank.reduce(sum, "USD")
    assert result == Money.dollar(7)
  end

  test "reduce money" do
    result = Bank.reduce(Money.dollar(1), "USD")
    assert result == Money.dollar(1)
  end

  test "reduce money different currency" do
    bank = Bank.add_rate("CHF", "USD", 2)
    result = Bank.reduce(Money.franc(2), "USD", bank)
    assert Money.dollar(1) == result
  end

  test "rate for the same currencies" do
    assert 1 == Bank.get_rate("USD", "USD", %Bank{})
  end

  test "mixed addition" do
    sum = Money.sum(Money.dollar(5), Money.franc(10))
    bank = Bank.add_rate("CHF", "USD", 2)
    result = Bank.reduce(sum, "USD", bank)
    assert Money.dollar(10) == result
  end

  test "sum of sum and money" do
    sum = Money.sum(Money.dollar(5), Money.franc(10))
    bank = Bank.add_rate("CHF", "USD", 2)
    sum = Sum.sum(sum, Money.dollar(5))
    result = Bank.reduce(sum, "USD", bank)

    assert Money.dollar(15) == result
  end

  test "sum multiplication" do
    sum = Money.sum(Money.dollar(5), Money.franc(10))
    bank = Bank.add_rate("CHF", "USD", 2)
    sum = Sum.multiply(sum, 2)
    result = Bank.reduce(sum, "USD", bank)
    assert result == Money.dollar(20)
  end
end
