defmodule Sum do
  defstruct [:augend, :addend]

  def reduce(sum, target_currency) do
    amount = sum.augend.amount + sum.addend.amount
    %Money{amount: amount, currency: target_currency}
  end
end
