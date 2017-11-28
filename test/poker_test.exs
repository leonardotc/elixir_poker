defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "return the highest ranked hand" do
    assert Poker.rank([fullhouse, fullhouse]) == fullhouse
    assert Poker.rank([fullhouse, straight_flush, flush]) == straight_flush
    assert Poker.rank([fullhouse, flush]) == fullhouse
    assert Poker.rank([straight, flush]) == fl
    assert Poker.rank([]) == nil
  end

  defp fullhouse do
    [(2, :diamonds), (2, :spades), (2, :hearts), (3, :diamonds), (3, :cups)]
  end

  defp straight_flush do
    [(2, :diamonds), (3, :diamonds), (4, :diamonds), (6, :diamonds), (5, :diamonds)]
  end

  defp flush do
    [(2, :diamonds), (12, :diamonds), (8, :diamonds), (1, :diamonds), (11, :diamonds)]
  end

  defp straight do
    [(5, :cups), (7, :spades), (4, :diamonds), (6, :hearts), (8, :diamonds)]
  end
end
