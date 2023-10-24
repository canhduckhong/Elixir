defmodule MaxFromList do
  def max(_list = []) do
    nil
  end

  def max(list) when not is_list(list) do
    nil
  end

  def max(_list = [head | []]) do
    head
  end

  def max(_list = [head | tail])do
    if head > max(tail) do head else max(tail) end
  end
end
