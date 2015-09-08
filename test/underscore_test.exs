defmodule UnderscoreTest do
  use ExUnit.Case

  test "first/1" do
    result = Underscore.first([])
    assert nil = result
  end

  test "first/1" do
    result = Underscore.first([1,2,3,4])
    assert 1 = result
  end

  test "first/2" do
    result = Underscore.first([], 2)
    assert nil = result
  end

  test "first/2" do
    result = Underscore.first([1,2,3,4], 2)
    assert [1,2] = result
  end

  test "initial/1" do
    result = Underscore.initial([])
    assert nil = result
  end

  test "initial/1" do
    result = Underscore.initial([1,2,3,4])
    assert [1,2,3] = result
  end

  test "initial/2" do
    result = Underscore.initial([1,2,3,4],2)
    assert [1,2] = result
  end

  test "initial/2" do
    result = Underscore.initial([],2)
    assert nil = result
  end

  test "rest/1" do
    result = Underscore.rest([])
    assert nil = result
  end

  test "rest/1" do
    result = Underscore.rest([1,2,3,4])
    assert [2,3,4] = result
  end

  test "rest/2" do
    result = Underscore.rest([],2)
    assert nil = result
  end

  test "rest/2" do
    result = Underscore.rest([1,2,3,4],2)
    assert [3,4] = result
  end

  test "compact/1" do
    result = Underscore.compact([1,2,3,4])
    assert [1,2,3,4] = result
  end

  test "compact/1" do
    result = Underscore.compact([1,false,nil,2])
    assert [1,2] = result
  end

  test "reverse/1" do
    result = Underscore.reverse([1,2,3,4])
    assert [4,3,2,1] = result
  end

  test "length/1" do
    result = Underscore.length([])
    assert 0 = result
  end

  test "length/1" do
    result = Underscore.length([1,2,3,4])
    assert 4 = result
  end

  test "flatten/1" do
    result = Underscore.flatten([1,2,[3,[4,5,6]]])
    assert [1,2,3,4,5,6] = result
  end

  test "without/2" do
    result = Underscore.without([1,1,2,2,3,3,4,4], [1,2,3])
    assert [4,4] = result
  end
end
