defmodule Sum do
  @behaviour Expression
  defstruct [:augend, :addend]

  def reduce(sum, target_currency, bank) do
    amount =
      Money.reduce(sum.augend, target_currency, bank).amount +
        Money.reduce(sum.addend, target_currency, bank).amount

    %Money{amount: amount, currency: target_currency}
  end

  @impl Expression
  def sum(arg0, arg1) do
    %Sum{}
  end
end
