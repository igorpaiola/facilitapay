defmodule ReportTest do
  use ExUnit.Case

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TesteFalicitaPay.Repo)
  end

  test "generate a DailyRegistrations.csv" do
    params = %{
      "report_name" => "DailyRegistrations",
      "start_date" => "2021-05-20",
      "end_date" => "2023-12-12"
    }

    assert Report.csv(params) == {:ok, "/home/igor/DailyRegistrations.csv"}
  end

  test "generate a DailyRegistrationsByPartner.csv" do
    params = %{
      "report_name" => "DailyRegistrationsByPartner",
      "start_date" => "2021-05-20",
      "end_date" => "2023-12-12",
      "partner_id" => "ccaade80-7a5b-11ed-a1eb-0242ac120002"
    }

    assert Report.csv(params) == {:ok, "/home/igor/DailyRegistrationsByPartner.csv"}
  end

  test "simulates an error, with incomplete header" do
    params = %{
      "start_date" => "2021-05-20",
      "end_date" => "2023-12-12"
    }

    assert Report.csv(params) == {:error, :bad_request}
  end
end
