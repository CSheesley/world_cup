require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/player'
require './lib/team'


class TeamTest < Minitest::Test

  def test_that_it_exists
    team = Team.new("France")

    assert_instance_of Team, team
  end

  def test_it_has_a_country_name
    team = Team.new("France")

    assert_equal "France", team.country
  end

  def test_its_elimination_status
    team = Team.new("France")

    refute team.eliminated?
  end

  def test_its_elimination_status_can_be_changes
    team = Team.new("France")
    team.eliminated = true

    assert team.eliminated?
  end

  def test_it_starts_with_an_empty_list_of_players
    team = Team.new("France")

    assert_equal [],team.players
  end

  def test_it_can_add_players_to_its_roster
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    assert_equal [mbappe, pogba], team.players
  end

  def test_players_can_be_sorted_by_position
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)
    # require 'pry'; binding.pry
    assert_equal [mbappe], team.players_by_position("forward")
    assert_equal [pogba], team.players_by_position("midfielder")
  end

end
