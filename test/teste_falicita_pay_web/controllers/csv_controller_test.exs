defmodule TesteFalicitaPayWeb.CSVControllerTest do
  use ExUnit.Case
  use TesteFalicitaPayWeb.ConnCase

  test "Returns 200 code and the name of the report", %{conn: conn} do
    params = %{
      "start_date" => "2021-05-20",
      "end_date" => "2023-12-12",
      "partner_id" => "ccaade80-7a5b-11ed-a1eb-0242ac120002"
    }

    response = post(conn, Routes.csv_path(conn, :create, "DailyRegistrations", params))
    assert response.status == 200
    assert response.params["report_name"] == "DailyRegistrations"

    response = post(conn, Routes.csv_path(conn, :create, "DailyRegistrationsByPartner", params))
    assert response.status == 200
    assert response.params["report_name"] == "DailyRegistrationsByPartner"
  end
end
