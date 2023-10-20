defmodule SelectionSortTest do
  use ExUnit.Case
  doctest SelectionSort

  test "sorts an empty array" do
    assert SelectionSort.sort([]) == []
  end

  test "sorts a nil object" do
    assert SelectionSort.sort(nil) == nil
  end

  test "sorts a list of integers" do
    assert SelectionSort.sort([1, 5, 4, 3, 10, 12]) == [1, 3, 4, 5, 10, 12]
  end

  test "sorts a list of float numbers" do
    assert SelectionSort.sort([-1, 5.1, 4.2, 4.1, 10.0, 12]) == [-1, 4.1, 4.2, 5.1, 10.0, 12]
  end
end
