defmodule MaxFromListTest do
  use ExUnit.Case
  doctest MaxFromList

  test "sorts an empty array" do
    assert MaxFromList.max([]) == nil
  end

  test "sorts a nil object" do
    assert MaxFromList.max(nil) == nil
  end

  test "sorts a list of integers" do
    assert MaxFromList.max([1, 5, 4, 3, 10, 12]) == 12
  end

  test "sorts a list of float numbers" do
    assert MaxFromList.max([-1, 5.1, 4.2, 4.1, 10.0, 12]) == 12
  end
end
