defmodule Sum do
  def sum(1), do: 1
  def sum(n), do: sum(n-1) + n
end
