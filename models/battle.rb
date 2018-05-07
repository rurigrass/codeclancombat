require_relative( '../db/sql_runner')

class Battle

  attr_reader :id
  attr_accessor :player1_id, :player2_id, :outcome

def initialize(options)
  @id = options['id'].to_i if options['id']
  @player1_id = options['player1_id'].to_i
  @player2_id = options['player2_id'].to_i
  @outcome = options['outcome']
end

def save()
  sql = "INSERT INTO battles (player1_id, player2_id, outcome) VALUES ( $1, $2, $3 ) RETURNING id"
  values = [@player1_id, @player2_id, @outcome]
  battle_data = SqlRunner.run(sql, values)
  @id = battle_data.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM battles"
  battle_data = SqlRunner.run (sql)
  return battle_data.map { |hash| Battle.new(hash) }
end

def get_player1
  Player.find(@player1_id)
end

def get_player2
  Player.find(@player2_id)
end

end
