defmodule Money do
  defstruct [:amount, :currency]

  def times(money, multiplier) do
    %Money{
      amount: multiplier * money.amount,
      currency: money.currency
    }
  end

  def sum(money1, money2) do
    %Sum{augend: money1, addend: money2}
  end

  def equals(money1, money2) do
    money1.amount == money2.amount && money1.currency == money2.currency
  end

  def reduce(money, target_currency) do
    money
  end

  def dollar(amount) do
    %Money{amount: amount, currency: "USD"}
  end

  def franc(amount) do
    %Money{amount: amount, currency: "CHF"}
  end
end
