defmodule Expression do
  @doc """
  Sums two expressions
  """
  @callback sum(Money.t() | Sum.t(), Money.t() | Sum.t()) :: Sum.t()

  @doc """
  Multiplies two expressions
  """
  @callback multiply(Money.t(), integer()) :: Money.t()
  @callback multiply(Sum.t(), integer()) :: Sum.t()
end
