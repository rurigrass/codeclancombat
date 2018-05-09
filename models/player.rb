require_relative('../db/sql_runner')

class Player

  attr_reader :id
  attr_accessor :name, :strength, :ability

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @strength = options['strength'].to_i
    @ability = options['ability'].to_i
  end

  def power()
    @strength + @ability
  end

  def save()
    sql = "INSERT INTO players (name, strength, ability) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @strength, @ability]
    player_data = SqlRunner.run(sql, values)
    @id = player_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM players"
    player_data = SqlRunner.run(sql)
    return player_data.map { |hash| Player.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM players WHERE id = $1"
    values = [id]
    player_data = SqlRunner.run(sql, values)
    return Player.new(player_data.first)
  end

  def update()
    sql = "UPDATE players SET
    (name, strength, ability) =
      ($1, $2, $3)
      WHERE id = $4"
      values = [@name, @strength, @ability, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM players WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def wins()
    sql = "SELECT * FROM battles where (player1_id = $1 AND outcome = $1) or (player2_id = $1 AND outcome = $1)"
    values = [@id]
    battle_data = SqlRunner.run(sql, values)
    result = battle_data.map { |battle| Battle.new(battle)}
    return result.count
  end

  def self.sort_by_wins
    player_wins = self.all
    sorted_players = player_wins.sort { |a, b| b.wins <=> a.wins
    }
    return sorted_players
  end



end
