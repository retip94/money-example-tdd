defmodule Bank do
  defstruct rates: %{}

  def reduce(source, target_currency, bank \\ %Bank{}) do
    if source.__struct__ == Money do
      Money.reduce(source, target_currency, bank)
    else
      Sum.reduce(source, target_currency, bank)
    end
  end

  def add_rate(currency, target_currency, rate, bank \\ %Bank{}) do
    rates = Map.put(bank.rates, {currency, target_currency}, rate)
    %Bank{bank | rates: rates}
  end

  def get_rate(currency, currency, _bank), do: 1

  def get_rate(from_currency, to_currency, bank) do
    Map.get(bank.rates, {from_currency, to_currency})
  end
end
