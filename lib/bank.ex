defmodule Bank do
  def reduce(source, target_currency) do
    if source.__struct__ == Money do
      Money.reduce(source, target_currency)
    else
      Sum.reduce(source, target_currency)
    end
  end
end
