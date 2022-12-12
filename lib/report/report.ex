defmodule Report do
alias TesteFalicitaPay.Repo
alias Inspect.Stream

  import Ecto.Query

  @headers ~w(
    id
    partner_id
    name
    cpf
    email
    inserted_at
  )a

  def csv(%{"report_name" => "DailyRegistrations", "filters" => filters}) do
    daily_registrations(filters)
  end

  def csv(%{"report_name" => "DailyRegistrationsByPartner", "filters" => filters}) do
    daily_registrations_by_partner(filters)
  end

  def csv(_params) do
    {:error, :bad_request}
  end

  defp daily_registrations(%{"start_date" => start_date, "end_date" => end_date}) do
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
    Registration
    |> where([r], fragment("? BETWEEN ? AND ?", r.inserted_at, ^start_date, ^end_date))
    |> where([r], r.partner_id == ^partner_id)
    |> Repo.all()
    |> csv_report("DailyRegistrationsByPartner")
  end

  defp csv_report(query, file_name) do

    output_path = "#{System.tmp_dir!()}/#{file_name}.csv"

    query
    |> CSV.encode(headers: @headers, separator: ?;)
    |> Stream.into(File.stream!(output_path, [:write, {:encoding, :latin1}]))
    |> Stream.run()

    output_path
  end

end
