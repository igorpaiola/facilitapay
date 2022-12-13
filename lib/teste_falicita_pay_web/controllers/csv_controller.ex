defmodule TesteFalicitaPayWeb.CSVController do
  use TesteFalicitaPayWeb, :controller

  def create(conn, params) do
    IO.puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    IO.inspect(params)
    IO.puts("@@@@@@@@@@@@@@@@@@@@@@@@@@@")

    with {:ok, result} <- Report.csv(params) do
      conn
      |> send_resp(:ok, result)
    end
  end
end
