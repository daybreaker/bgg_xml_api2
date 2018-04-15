defmodule BggXmlApi2.Collection do
  @moduledoc """
  A set of functions for searching and retrieving information on Collections.
  """
  import SweetXml

  alias BggXmlApi2.Api, as: BggApi
  alias BggXmlApi2.{Item}

  @doc """
  Returns an array of game names from a user's collection
  """
  def game_names(username) do
    result =
      "/collection?username=#{username}&own=1&excludesubtype=boardgameexpansion&brief=1"
      |> get_collection()
      |> Map.get(:body)
      |> xpath(~x"//item/name/text()"l)
      |> Enum.map(&List.to_string/1)

    {:ok, result}
  end

  @doc """
  Returns an array of game ids from a user's collection
  """
  def game_ids(username) do
    result =
      "/collection?username=#{username}&own=1&excludesubtype=boardgameexpansion&brief=1"
      |> get_collection()
      |> Map.get(:body)
      |> xpath(~x"//item/@objectid"l)
      |> Enum.map(&List.to_string/1)

    {:ok, result}
  end

  def all_games(username) do
    result =
      game_ids(username)
      |> elem(1)
      |> Enum.join(",")
      |> Item.info

    result
  end

  defp get_collection(url) do
    get_collection(url, BggApi.get!(url))
  end

  defp get_collection(url, %HTTPoison.Response{status_code: 202}) do
    Process.sleep(500)
    get_collection(url, BggApi.get!(url))
  end

  defp get_collection(_url, %HTTPoison.Response{status_code: 200} = response) do
    response
  end

  defp get_collection(_url, response), do: response
end
