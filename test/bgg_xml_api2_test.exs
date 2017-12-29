defmodule BggXmlApi2Test do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start()
  end

  test "board game info convenience function" do
    use_cassette "search_and_info_on_scythe" do
      assert BggXmlApi2.board_game_info("Scythe") ==
               %BggXmlApi2.Item{
                 id: "169786",
                 name: "Scythe",
                 type: "boardgame",
                 year_published: "2016",
                 description: scythe_description(),
                 thumbnail:
                   "https://cf.geekdo-images.com/images/pic3163924_t.jpg",
                 min_players: 1,
                 max_players: 5,
                 playing_time: 115,
                 min_play_time: 90,
                 max_play_time: 115
               }
    end
  end

  defp scythe_description() do
    "It is a time of unrest in 1920s Europa. The ashes from the first great war still darken the snow. The capitalistic city-state known simply as “The Factory”, which fueled the war with heavily armored mechs, has closed its doors, drawing the attention of several nearby countries.\n\nScythe is an engine-building game set in an alternate-history 1920s period. It is a time of farming and war, broken hearts and rusted gears, innovation and valor. In Scythe, each player represents a character from one of five factions of Eastern Europe who are attempting to earn their fortune and claim their faction's stake in the land around the mysterious Factory. Players conquer territory, enlist new recruits, reap resources, gain villagers, build structures, and activate monstrous mechs.\n\nEach player begins the game with different resources (power, coins, combat acumen, and popularity), a different starting location, and a hidden goal. Starting positions are specially calibrated to contribute to each faction’s uniqueness and the asymmetrical nature of the game (each faction always starts in the same place).\n\nScythe gives players almost complete control over their fate. Other than each player’s individual hidden objective card, the only elements of luck or variability are “encounter” cards that players will draw as they interact with the citizens of newly explored lands. Each encounter card provides the player with several options, allowing them to mitigate the luck of the draw through their selection. Combat is also driven by choices, not luck or randomness.\n\nScythe uses a streamlined action-selection mechanism (no rounds or phases) to keep gameplay moving at a brisk pace and reduce downtime between turns. While there is plenty of direct conflict for players who seek it, there is no player elimination.\n\nEvery part of Scythe has an aspect of engine-building to it. Players can upgrade actions to become more efficient, build structures that improve their position on the map, enlist new recruits to enhance character abilities, activate mechs to deter opponents from invading, and expand their borders to reap greater types and quantities of resources. These engine-building aspects create a sense of momentum and progress throughout the game. The order in which players improve their engine adds to the unique feel of each game, even when playing one faction multiple times.\n\n"
  end
end
