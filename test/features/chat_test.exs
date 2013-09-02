defmodule ChatTest do
  use Dynodemo.TestCase

  # use Dynamo.HTTP.Case

  test "is always true" do
    assert true == Dynodemo.Dynochat.true? 1
  end


  # test "returns OK" do
  #   conn = get("/")
  #   assert conn.status == 200
  # end
end
