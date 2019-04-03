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
end
