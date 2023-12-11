defmodule SimpleHttp.List do
  @moduledoc """
  Functions for working with any lists (rather than only Keyword lists)
  """

  @doc """
  Pop an element from a list

  ## Example
      iex(1)> SimpleHttp.List.pop([{"a", 1}, {:b, 2}], :b)
      {2, [{"a", 1}]}
      iex(1)> SimpleHttp.List.pop([{"a", 1}, {:b, 2}], "a")
      {1, [{:b, 2}]}
      iex(1)> SimpleHttp.List.pop([{"a", 1}, {:b, 2}], :c)
      {nil, [{"a", 1}, {:b, 2}]}
  """
  def pop(map,  key) when is_map(map),   do: Map.pop(map, key)
  def pop(list, key) when is_list(list), do: pop(list, key, [])

  @doc """
  Merge two lists

  ## Example
      iex(1)> SimpleHttp.List.merge([{"a", 1}, {:b, 2}], [{:b, 3}])
      [{"a", 1}, {:b, 3}]
      iex(2)> SimpleHttp.List.merge([{"a", 1}, {:b, 2}], [{:c, 3}])
      [{"a", 1}, {:b, 2}, {:c, 3}]
  """
  def merge(list1, list2) do
    list1 = :lists.filter(fn({k, _}) -> not :lists.keymember(k, 1, list2) end, list1)
    list1 ++ list2
  end

  defp pop([{k, v} | t], k, acc), do: {v, :lists.reverse(acc) ++ t}
  defp pop([kv | t],     k, acc), do: pop(t, k, [kv | acc])
  defp pop([],           _, acc), do: {nil, :lists.reverse(acc)}
end
