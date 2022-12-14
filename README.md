# TesteFalicitaPay

Project Summary
  * This project proposes the creation of a Phoenix API with only one endpoint that will generate csv reports.
  * This endpoint should respond to two reports.
  
  * DailyRegistrations - Returns the total records registered per day.
  * DailyRegistrationsByPartner - Returns the total registrations registered per day by partner
  
Database structure

  * Table "partner"
   id (UUID)
   name (string)
 
  * Table "registration"
   id (UUID)
   partner_id (UUID)
   name (string)
   cpf (string)
   email (string)
   inserted_at(date/time)
 
Route
  * post /csv_report/:report_name, :create
 
Accepted Filters
  * start_date, end_date and partner_id
  
Used Versions
  * Elixir 1.12.2
  * Erlang/OTP 24
  * Phoenix 1.6.15
  * Postgresql 14.5
  

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

To call the endpoint:

   * Sample url  "http://localhost:4000/csv_report/DailyRegistrations"
   * Sample Body JSON:
     {
      "start_date": "2021-05-20", 
      "end_date": "2023-12-12"
     }
     
   * Sample url  "http://localhost:4000/csv_report/DailyRegistrationsByPartner"
   * Sample Body JSON:
     {
      "start_date": "2021-05-20", 
      "end_date": "2023-12-12",
      "partner_id": "##PARTNER_ID_HERE##"
     }


## Learn more

* Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
# facilitapay
