# Rpssl

Rock, Paper, Scissors, Spock, Lizard game. [Read details](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors#Additional_weapons)


## Description

Can easily be extended to more roles by modifying the following function:

```elixir
winner(p1, p2) do
  delta = rem (5 + p1 - p2), 5
  case delta do
    0                     -> '-> Tie'
    x when rem(x, 2) == 0 -> '-> P2 Wins'
    x when rem(x, 2) == 1 -> '-> P1 Wins'
  end
end
```

Assigning number to role, each successive number should defeat the number it succeeds, but lose the number it preceeds

```
(0) (1) (2)
 R   P   S
```

* 0 beats 2
* 0 loses to 1
* 1 beats 0
* 1 loses to 2
* 2 beats 1
* 2 loses to 0


General function is:

` (num_roles + role_num_p1 - role_num_p2) modulo num_roles`

* 0 denotes winner
* even denotes p2 wins
* odd denotes p1 wins


## Usage

Easiest usage is through interactive Elixir in your shell:

`cd ~/path/to/repo`
`$ iex lib/rpssl.ex`
`> require Rpssl`
`> Rpssl.play`

