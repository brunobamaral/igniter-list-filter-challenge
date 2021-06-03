defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "count and return only number unpair of a list" do
      example = ["1", "3", "6", "43", "banana", "6", "abc"]

      response = ListFilter.call(example)

      assert response == 3
    end
  end
end
