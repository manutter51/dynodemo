Dynamo.under_test(Dynodemo.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Dynodemo.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
