defmodule TesteFalicitaPayWeb.CSVController do
  use TesteFalicitaPayWeb, :controller

  def create(params) do
    Report.csv(params)
  end
end
