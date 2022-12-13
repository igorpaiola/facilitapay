defmodule TesteFalicitaPayWeb.CSVController do

  use TesteFalicitaPayWeb, :controller

  def create(conn, params) do
    Report.csv(params)

    conn
    |> put_status(:ok)
  end
end
