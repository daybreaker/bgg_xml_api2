defmodule BggXmlApi2.CollectionTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias BggXmlApi2.Collection

  setup_all do
    HTTPoison.start()
  end

  test "retrieve game names from collection" do
    use_cassette "shdb_collection" do
      assert Collection.game_names("shdb") ==
               {:ok,
                [
                  "Android: Netrunner",
                  "Arkham Horror: The Card Game",
                  "Ascension: Apprentice Edition",
                  "Betrayal at House on the Hill",
                  "The Castles of Burgundy",
                  "Codenames: Pictures",
                  "Cthulhu Fluxx",
                  "Dead of Winter: A Crossroads Game",
                  "Dixit",
                  "Dominion",
                  "Eldritch Horror",
                  "Elixir",
                  "A Game of Thrones: The Card Game (Second Edition)",
                  "Hive",
                  "Jaipur",
                  "King of Tokyo",
                  "The Lord of the Rings: The Card Game",
                  "Lords of Waterdeep",
                  "Monopoly",
                  "Onitama",
                  "The Resistance: Avalon",
                  "Risk: Balance of Power",
                  "Roll for the Galaxy",
                  "Scythe",
                  "Specter Ops",
                  "Star Realms",
                  "Star Wars: X-Wing Miniatures Game",
                  "Suburbia",
                  "Ticket to Ride: Europe",
                  "Zombicide",
                  "Zombicide: Black Plague"
                ]}
    end
  end

  test "retrieve game ids from collection" do
    use_cassette("shdb_collection") do
      assert Collection.game_ids("shdb") ==
               {:ok,
                ~w(
                    124742 205637 145633 10547 84876 198773 122159 150376 39856 36218 146021 633 169255 2655 54043 70323
	                  77423 110327 1406 160477 128882 40251 132531 169786 155624 147020 103885 123260 14996 113924 176189
                )
               }
    end
  end
end
