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


end
