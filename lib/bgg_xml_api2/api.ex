defmodule BggXmlApi2.Api do
  use HTTPoison.Base

  @endpoint "https://www.boardgamegeek.com/xmlapi2"

  def process_url(url) do
    @endpoint <> url
  end
end