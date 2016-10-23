defmodule RpsslTest do
  use ExUnit.Case
  doctest Rpssl

  
  test "roles have not changed" do
    assert Rpssl.role_name(0) == 'rock'
    assert Rpssl.role_name(1) == 'paper'
    assert Rpssl.role_name(2) == 'scissors'
    assert Rpssl.role_name(3) == 'spock'
    assert Rpssl.role_name(4) == 'lizard'
  end

  test "choose role returns integer in range [0,4]" do
    returned_nums = for _x <- 0..1000, do: Rpssl.choose_role
    assert Enum.any?(returned_nums, fn(num) -> num < 0 || num > 4 || !is_integer(num) end) == false
  end

  test "outcome p1 and p2 tied" do
    ties = for x <- 0..4, do: Rpssl.winner(x, x)
    msg = '-> Tie'
    assert Enum.any?(ties, fn(result) -> result != msg end) == false
  end

  test "outcome p1 wins" do
    p1_wins = for x <- 0..4, do: Rpssl.winner(x, rem(x - 1, 5))
    msg = '-> P1 Wins'
    assert Enum.any?(p1_wins, fn(result) -> result != msg end) == false
  end
  
  test "outcome p2 wins" do
    p1_wins = for x <- 0..4, do: Rpssl.winner(x, rem(x + 1, 5))
    msg = '-> P2 Wins'
    assert Enum.any?(p1_wins, fn(result) -> result != msg end) == false
  end
end

