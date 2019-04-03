defmodule Euler do
  @moduledoc """
  Documentation for Euler.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Euler.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """
  def sol_1 do
    1..999 |> Enum.filter(&(rem(&1, 3) == 0 or rem(&1, 5) == 0)) |> :lists.sum()
  end

  def fib(n) do
    fib_iter(n, 0, 1)
  end

  def fib_iter(0, result, _Next) do
    result
  end

  def fib_iter(iter, result, next) when iter > 0 do
    fib_iter(iter-1, next, result+next)
  end

  @doc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """
  def sol_2 do
    1..40 |>
      Enum.to_list |>
      Enum.map(&fib/1) |>
      Enum.take_while(&(&1 < 4_000_000)) |>
      Enum.filter(&(rem(&1, 2) == 0)) |>
      :lists.sum()
  end

  def factors(n), do: factors(n, 2, [])

  def factors(n, k, acc) when n < k*k, do: Enum.reverse(acc, [n])
  def factors(n, k, acc) when rem(n, k) == 0, do: factors(div(n, k), k, [k | acc])
  def factors(n, k, acc), do: factors(n, k+1, acc)

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
  """
  def sol_3 do
    600_851_475_143 |> factors |> :lists.max
  end
end
