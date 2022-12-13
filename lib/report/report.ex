defmodule Report do
  use Timex

  alias TesteFalicitaPay.Repo
  alias Ecto.UUID

  import Ecto.Query

  @headers ~w(
    id
    partner_id
    name
    cpf
    email
    inserted_at
  )a

  def csv(%{"report_name" => "DailyRegistrations"} = params) do
    daily_registrations(params)
  end

  def csv(%{"report_name" => "DailyRegistrationsByPartner"} = params) do
    daily_registrations_by_partner(params)
  end

  def csv(_params) do
    {:error, :bad_request}
  end

  defp daily_registrations(%{"start_date" => start_date, "end_date" => end_date}) do
    start_date = Timex.parse!(start_date, "{YYYY}-{0M}-{0D}")
    end_date = Timex.parse!(end_date, "{YYYY}-{0M}-{0D}")

    Registration
    |> where([r], fragment("? BETWEEN ? AND ?", r.inserted_at, ^start_date, ^end_date))
    |> Repo.all()
    |> csv_report("DailyRegistrations")
  end

  defp daily_registrations_by_partner(%{
         "start_date" => start_date,
         "end_date" => end_date,
         "partner_id" => partner_id
       }) do
    start_date = Timex.parse!(start_date, "{YYYY}-{0M}-{0D}")
    end_date = Timex.parse!(end_date, "{YYYY}-{0M}-{0D}")

    Registration
    |> where([r], fragment("? BETWEEN ? AND ?", r.inserted_at, ^start_date, ^end_date))
    |> where([r], r.partner_id == ^UUID.dump!(partner_id))
    |> Repo.all()
    |> csv_report("DailyRegistrationsByPartner")
  end

  defp csv_report(query, file_name) do
    output_path = "/home/igor/#{file_name}.csv"

    query
    |> CSV.encode(headers: @headers, separator: ?;)
    |> Stream.into(File.stream!(output_path, [:write]))
    |> Stream.run()

    {:ok, output_path}
  end
end
