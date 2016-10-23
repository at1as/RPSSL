defmodule Rpssl do

  def auto_play do
    p1 = choose_role
    p2 = choose_role
    printer(p1, p2)
  end

  def play_loop do
    play
    play_loop
  end

  def play do
    try do
      p1 = IO.gets """
        Choose your piece:
        \t 0 for rock,
        \t 1 for paper,
        \t 2 for scissors,
        \t 3 for spock,
        \t 4 for lizard\n
        """
      p1 = String.strip(p1) |> String.to_integer

      unless p1 in [0,1,2,3,4], do: raise "Bad input"
      p2 = choose_role
      printer(p1, p2)
    rescue
      _ -> play
    end
  end

  def choose_role do
    :rand.uniform(5) - 1 
  end

  def role_name(num) do
    case num do
      0 -> 'rock'
      1 -> 'paper'
      2 -> 'scissors'
      3 -> 'spock'
      4 -> 'lizard'
    end
  end

  def winner(p1, p2) do
    delta = rem (5 + p1 - p2), 5
    case delta do
      0                     -> '-> Tie'
      x when rem(x, 2) == 0 -> '-> P2 Wins'
      x when rem(x, 2) == 1 -> '-> P1 Wins'
    end
  end

  def printer(p1, p2) do
    IO.puts "Your role is #{role_name(p1)} and your opponent is #{role_name(p2)}"
    IO.puts "#{winner(p1, p2)}"
  end
end
