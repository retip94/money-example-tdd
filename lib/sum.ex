defmodule Sum do
  @behaviour Expression
  defstruct [:augend, :addend]

  def reduce(sum, target_currency, bank) do
    amount =
      Bank.reduce(sum.augend, target_currency, bank).amount +
        Bank.reduce(sum.addend, target_currency, bank).amount

    %Money{amount: amount, currency: target_currency}
  end

  @impl Expression
  def sum(expression1, expression2) do
    %Sum{augend: expression1, addend: expression2}
  end

  @impl Expression
  def multiply(expression, multiplier) do
    %Sum{
      augend: expression.augend.__struct__.multiply(expression.augend, multiplier),
      addend: expression.addend.__struct__.multiply(expression.addend, multiplier)
    }
  end
end
