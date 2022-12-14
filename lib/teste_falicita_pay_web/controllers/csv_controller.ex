defmodule TesteFalicitaPayWeb.CSVController do
  use TesteFalicitaPayWeb, :controller

  def create(conn, params) do
    with {:ok, result} <- TesteFalicitaPay.Report.csv(params) do
      send_download(conn, {:file, result})
    end
  end
end
