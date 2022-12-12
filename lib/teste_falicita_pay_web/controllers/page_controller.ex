defmodule TesteFalicitaPayWeb.PageController do
  use TesteFalicitaPayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(_conn, _params) do

  end

end
