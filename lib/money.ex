defmodule Money do
  defstruct [:amount, :currency]

  def times(money, multiplier) do
    %Money{
      amount: multiplier * money.amount,
      currency: money.currency
    }
  end

  def equals(money, money2) do
    money.amount == money2.amount && money.currency == money2.currency
  end

  def dollar(amount) do
    %Money{amount: amount, currency: "USD"}
  end

  def franc(amount) do
    %Money{amount: amount, currency: "CHF"}
  end
end
