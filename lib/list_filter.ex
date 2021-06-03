defmodule ListFilter do
  def call(list), do: filter(list, 0)
  defp filter([], acc), do: acc

  defp filter([head | tail], acc) do
    x = head |> convert_to_int() |> only_number()
    acc = acc + x
    filter(tail, acc)
  end

  defp only_number(small_list) when is_tuple(small_list), do: 0

  defp only_number(small_list) when is_list(small_list) do
    small_list
    |> Enum.fetch!(0)
    |> is_unpar()
  end

  defp is_unpar(value) do
    rest =
      value
      |> rem(2)

    case rest do
      0 -> 0
      1 -> 1
    end
  end

  defp convert_to_int(elemnet) do
    case Integer.parse(elemnet) do
      {int, _rest} -> [int]
      :error -> {:error}
    end
  end
end
