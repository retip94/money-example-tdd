defmodule Expression do
  @doc """
  Sums two expressions
  """
  @callback sum(Money.t(), Money.t()) :: Sum.t()
end
