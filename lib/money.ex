defmodule Money do
  defstruct [:amount]

  def times(%Money{} = money, multiplier) do
    %Money{amount: multiplier * money.amount}
  end

  def equals(money, money2) do
    money.amount == money2.amount && money.__struct__ == money2.__struct__
  end
end
