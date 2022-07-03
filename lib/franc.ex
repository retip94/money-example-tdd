defmodule Franc do
  defstruct [:amount]

  def times(%Franc{} = franc, multiplier) do
    %Franc{amount: multiplier * franc.amount}
  end
end
