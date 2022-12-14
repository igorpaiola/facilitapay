defmodule TesteFalicitaPay.Report do
  @moduledoc """
  Responsible for all the intelligence for handling the CSV.
  """

  use Timex

  alias TesteFalicitaPay.Repo
  alias Ecto.UUID
  alias TesteFalicitaPay.Models.Registration

  import Ecto.Query

  @headers ~w(
    id
    partner_id
    name
    cpf
    email
    inserted_at
  )a

  @spec csv(map()) :: {:ok, charlist()} | {:error, :bad_request}
  def csv(%{"report_name" => "DailyRegistrations"} = params) do
    start_date = Timex.parse!(params["start_date"], "{YYYY}-{0M}-{0D}")
    end_date = Timex.parse!(params["end_date"], "{YYYY}-{0M}-{0D}")

    Registration
    |> where([r], fragment("? BETWEEN ? AND ?", r.inserted_at, ^start_date, ^end_date))
    |> Repo.all()
    |> csv_report(params["report_name"])
  end

  def csv(%{"report_name" => "DailyRegistrationsByPartner"} = params) do
    start_date = Timex.parse!(params["start_date"], "{YYYY}-{0M}-{0D}")
    end_date = Timex.parse!(params["end_date"], "{YYYY}-{0M}-{0D}")
    partner_id = params["partner_id"]

    Registration
    |> where([r], fragment("? BETWEEN ? AND ?", r.inserted_at, ^start_date, ^end_date))
    |> where([r], r.partner_id == ^UUID.dump!(partner_id))
    |> Repo.all()
    |> csv_report(params["report_name"])
  end

  def csv(_params) do
    {:error, :bad_request}
  end

  defp csv_report(data, file_name) do
    output_path = "#{System.tmp_dir!()}/#{file_name}.csv"

    data
    |> CSV.encode(headers: @headers, separator: ?;)
    |> Stream.into(File.stream!(output_path, [:write]))
    |> Stream.run()

    {:ok, output_path}
  end
end
