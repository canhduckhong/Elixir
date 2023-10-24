defmodule QuickSort do
  @moduledoc """
    Quick sort algorithm uses a divide and conquer strategy.
    It takes a pivot, and divide the rest into a smaller and bigger group.
    Execute the step until there is empty list
    Example:
      [2, 1, 5, 4, 3]
      Steps:
      #1 pivot:2 smaller:[1] bigger:[5, 4, 3]
      #2 2 [1] [5, 4, 3]
      #3 2 [1] |
              | 5 [4, 3] []
      #4 2 [1] |
                | 5 |
                    | 4 [3] []
      #5 [1, 2, 3, 4, 5] # Recursion reunite all splited lists.

    [2, 1, 5, 4, 3] => [1, 2, 3, 4, 5]
    Complexity: O(n log n)
  """
  def sort(_list = []) do
    []
  end

  def sort(list) when not is_list(list) do
    nil
  end

  def sort(_list = [head | tail]) do
    smaller = Enum.filter(tail, fn x -> x <= head end) |> sort()
    bigger = Enum.filter(tail, fn x -> x > head end) |> sort()
    Enum.concat(smaller, [head]) |> Enum.concat(bigger)
  end
end
