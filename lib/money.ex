defmodule Money do
  defstruct [:amount, :currency]

  def times(money, multiplier) do
    struct(money.__struct__, amount: multiplier * money.amount)
  end

  def equals(money, money2) do
    money.amount == money2.amount && money.__struct__ == money2.__struct__
  end

  def dollar(amount) do
    %Dollar{amount: amount}
  end

  def franc(amount) do
    %Franc{amount: amount}
  end
end
