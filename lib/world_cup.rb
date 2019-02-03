class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_teams
    active_teams = @teams.reject do |team|
      team.eliminated?
    end
  end

  def active_players
    active_players = active_teams.map do |team|
      team.players
    end
    active_players.flatten!
  end

  def active_players_by_position(position)
    active_players_by_position = active_players.select do |player|
      player.position == position
    end
  end

  def all_players
    all_players = @teams.map do |team|
      team.players
    end
    all_players.flatten!
  end

  def all_players_by_position
    all_players.group_by do |player|
      player.position
    end
  end

end
