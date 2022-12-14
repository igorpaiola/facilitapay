defmodule TesteFalicitaPayWeb.Router do
  use TesteFalicitaPayWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TesteFalicitaPayWeb.LayoutView, :root}
    plug :put_secure_browser_headers
  end

  scope "/", TesteFalicitaPayWeb do
    pipe_through :browser
    post "/csv_report/:report_name", CSVController, :create
  end
end
