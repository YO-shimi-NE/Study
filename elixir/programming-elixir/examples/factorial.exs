defmodule Factorial do
  def of(0), do: 1
  def of(n) do n * of(n - 1) end

  def of_guard(0), do: 1
  def of_guard(n) when is_integer(n) and n > 0 do n * of(n - 1) end
end
