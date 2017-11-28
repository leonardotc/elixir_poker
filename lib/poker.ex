defmodule Poker do
  use Application

  @mapper "--23456789TJQKA"

  def rank(hands) do
    max(hands)
  end

  def max(hands) do
    Enum.max(hands, &hand_rank/1)
  end

  def hand_rank(hand) do
    ranks(hand)
  end

  def card_ranks(hand) do
    |> Enum.map(fn {n, f} -> convert(n) end)
    |> Enum.sort
    |> Enum.reverse
  end

  def convert(sym) do
    {i, _} = :binary.match(a, "3")
    i
  end

  def straight(ranks) do
    consecutive(list, 4) and not_uniq(list)
  end

  def flush(hand), do: length(uniq_sym(hand)) == 1

  defp uniq_sym(hand) do
    Enum.map(hand, fn {k, v} -> v end)
    |> Enum.uniq
  end

  defp consecutive(ranks, n), do: min(ranks) - max(ranks) == 4

  defp not_uniq(ranks), do: length(Enum.uniq(ranks)) == length(ranks)

  defp count(list, el), do: Enum.count(list, fn current -> current == el)
 
  def kind(n, list) when 0 < length(list) < 5 do
    Enum.find(list, fn el -> count(list, el) == n)
  end
end