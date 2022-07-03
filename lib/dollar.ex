defmodule Dollar do
  defstruct [:amount]

  def times(%Dollar{} = dollar, multiplier) do
    %Dollar{amount: multiplier * dollar.amount}
  end
end
