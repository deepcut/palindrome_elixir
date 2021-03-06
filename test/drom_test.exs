defmodule DromTest do
  use ExUnit.Case
  doctest Drom

  test "returns nil when the string is nil" do
    assert Drom.find(nil) == nil
  end

  test "when the string is a palindrome" do
    str = "aca"
    assert Drom.find(str) == [str]

    str = "ada"
    assert Drom.find(str) == [str]
  end

  test "when the palindrome is in the beginning" do
    str = "acablah"
    assert Drom.find(str) == ["aca"]
  end

  test "when the palindrome is in the middle" do
    str = "supacayoo"
    assert Drom.find(str) == ["aca"]
  end

  test "when the palindrome is in the end" do
    str = "supyo11aca"
    assert Drom.find(str) == ["aca"]
  end

  test "when the palindrome is longer" do
    str = "acaoooioooblah"
    assert Drom.find(str) == ["oooiooo"]
  end

  test "when there are no palindromes" do
    str = "123456"
    assert Drom.find(str) == []
  end

  test "when the long str is a palindrome" do
    str = "abdedba"
    assert Drom.find(str) == [str]
  end

  test "when there are more than one palindrome, find them all" do
    str = "abracadabra"
    str1 = "bananaututu"
    str2 = "bcannacututu"
    str3 = "bututucannaczca22ac"
    str4 = "bututucannaczca22accananac"

    assert Drom.find(str) == ["aca", "ada"]
    assert Drom.find(str1) == ["anana", "ututu"]
    assert Drom.find(str2) == ["cannac"]
    assert Drom.find(str3) == ["cannac", "ca22ac"]
    assert Drom.find(str4) == ["cananac"]
  end
end
