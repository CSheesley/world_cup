require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @croatia = Team.new("Croatia")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
  end

  def test_it_exists
    world_cup = WorldCup.new(2018, [@france, @croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_that_it_has_attributes
    world_cup = WorldCup.new(2018, [@france, @croatia])

    assert_equal 2018, world_cup.year
    assert_equal [@france, @croatia], world_cup.teams
  end

  def test_it_can_show_active_players_by_position
    world_cup = WorldCup.new(2018, [@france, @croatia])
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    assert_equal [@pogba, @modric], world_cup.active_players_by_position("midfielder")
  end

  def test_it_can_show_only_active_players_after_a_team_has_been_eliminated
    world_cup = WorldCup.new(2018, [@france, @croatia])
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @croatia.eliminated = true

    assert_equal [@pogba], world_cup.active_players_by_position("midfielder")
  end

  def test_it_can_show_all_players
    world_cup = WorldCup.new(2018, [@france, @croatia])
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    assert_equal [@mbappe, @pogba, @modric, @vida], world_cup.all_players
  end

  def test_it_can_show_all_active_players_by_position
    world_cup = WorldCup.new(2018, [@france, @croatia])
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    expected = { "forward" => [@mbappe], "midfielder" => [@pogba, @modric], "defender" => [@vida]}

    assert_equal expected, world_cup.all_players_by_position
  end

end
