defmodule SelectionSort do
  def sort(_list = []) do
    []
  end

  def sort(list) when not is_list(list) do
    list
  end

  def sort(list) when is_list(list) do
    do_selection(list, [])
  end

  defp do_selection([head | []], acc) do
    acc ++ [head]
  end

  defp do_selection(list, acc) do
    min = min(list)
    do_selection(delete_item(min, list), acc ++ [min])
  end

  defp delete_item(item, list) do
    Enum.filter(list, fn i -> i != item end)
  end

  defp min([first | [second | []]]) do
    smaller(first, second)
  end

  defp min([first | [second | tail]]) do
    min([(smaller(first, second)) | tail])
  end

  defp smaller(e1, e2) do
    if e1 <= e2 do e1 else e2 end
  end
end
