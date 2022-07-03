defmodule MoneyExampleTddTest do
  use ExUnit.Case
  doctest MoneyExampleTdd

  test "greets the world" do
    assert MoneyExampleTdd.hello() == :world
  end
end
