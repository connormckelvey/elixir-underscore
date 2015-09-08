defmodule Underscore do
  @moduledoc """
  Provides helper functions for collections similar
  to Underscore.js

  ## Examples

     iex> Underscore.first([1,2])
     1

  """

  @doc """
  Get the first element of an list. Passing **n** will return the first N
  values in the list.

  ## Examples

     iex> Underscore.first([1,2])
     1
     iex> Underscore.first([1,2,3,4], 3)
     [1,2,3]
  """

  def first(list, n) do
    do_first list, n - 1
  end

  def first(list) do
    do_first list
  end

  defp do_first([], n) do
    nil
  end

  defp do_first([head | tail], 0) do
    [head]
  end

  defp do_first([head | tail], n) do
    [head] ++ do_first tail, n - 1
  end

  defp do_first([]) do
    nil
  end

  defp do_first([head | tail]) do
    head
  end

  @doc """
  Returns everything but the last entry of the list. Passing **n** will
  return all the values in the list, excluding the last N.

  ## Examples

     iex> Underscore.initial([1,2])
     1
     iex> Underscore.initial([1,2,3,4], 2)
     [1,2,3]
  """

  def initial(list, n) do
    do_initial list, n
  end

  def initial(list) do
    do_initial list
  end

  defp do_initial([], n) do
    nil
  end

  defp do_initial(list, 0) do
    list
  end

  defp do_initial(list, n) do
    [head | tail] = reverse(list)
    do_initial reverse(tail), n - 1
  end

  defp do_initial([]) do
    nil
  end

  defp do_initial(list) do
    [head | tail] = reverse list
    reverse(tail)
  end

  @doc """
  Returns the rest of the elements in a list. Pass an index to return the
  values of the list from that index onward.

  ## Examples

     iex> Underscore.rest([1,2])
     [2]
     iex> Underscore.rest([1,2,3,4], 2)
     [3,4]
  """

  def rest(list, n) do
    do_rest list, n
  end

  def rest(list) do
    do_rest list
  end

  defp do_rest([], n) do
    nil
  end

  defp do_rest(list, 0) do
    list
  end

  defp do_rest([head | tail], n) do
    do_rest tail, n - 1
  end

  defp do_rest([]) do
    nil
  end

  defp do_rest(list) do
    [head | tail] = list
    tail
  end

  @doc """
  eturns a copy of the array with all falsy values removed. In Elixir,
  only nil and false are falsey.

  ## Examples

     iex> Underscore.compact([1,2, false, "", nil, 3])
     [1,2,"",3]
  """

  def compact(list) do
    do_compact list
  end

  defp do_compact(base, [head | []]) do
    base ++ [head]
  end

  defp do_compact(base, [:false | tail]) do
    do_compact(base, tail)
  end

  defp do_compact(base, [:nil | tail]) do
    do_compact(base, tail)
  end

  defp do_compact(base, [head | tail]) do
    do_compact(base ++ [head], tail)
  end

  defp do_compact([head | tail]) do
    do_compact([head], tail)
  end


  @doc """
  Reverses the items in list

  ## Examples

     iex> Underscore.reverse([1,2])
     [2,1]
  """

  def reverse(list) do
    do_reverse list
  end

  defp do_reverse(base, []) do
    base
  end

  defp do_reverse(base, [head | tail]) do
    do_reverse [head] ++ base, tail
  end

  defp do_reverse([]) do
    []
  end

  defp do_reverse([head | tail]) do
    do_reverse [head], tail
  end

  @doc """
  Returns the length of a list

  ## Examples

     iex> Underscore.length([1,2])
     2
  """

  def length(list) do
    do_length list
  end

  defp do_length([]) do
    0
  end

  defp do_length([head | tail]) do
    1 + do_length tail
  end

  @doc """
  Returns a flattened list

  ## Examples

     iex> Underscore.flatten([1,2, [2, [4,5,6]]])
     [1,2,3,4,5,6]
  """

  def flatten(list) do
    do_flatten(list)
  end

  defp do_flatten([]) do
     []
  end

  defp do_flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end

  defp do_flatten(head) do
    [head]
  end

end
