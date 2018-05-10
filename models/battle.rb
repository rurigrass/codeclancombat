require_relative( '../db/sql_runner')

class Battle

  attr_reader :id
  attr_accessor :player1_id, :player2_id, :outcome

def initialize(options)
  @id = options['id'].to_i if options['id']
  @player1_id = options['player1_id'].to_i
  @player2_id = options['player2_id'].to_i
  @outcome = options['outcome'].to_i
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

def get_player(player_id, player_column)
   sql = "SELECT players.name FROM players
   INNER JOIN battles ON players.id = battles.#{player_column}
   WHERE players.id = $1"
   values = [player_id]
   player_hash = SqlRunner.run(sql, values)
   player = Player.new(player_hash.first)
   return player
 end

 def self.find(id)
   sql = "SELECT * FROM battles WHERE id = $1"
   values = [id]
   battle_data = SqlRunner.run(sql, values)
   return Battle.new(battle_data.first)
 end

 def update()
   sql = "UPDATE battles SET (player1_id, player2_id, outcome) = ( $1, $2, $3 ) WHERE id = $4"
   values = [@player1_id, @player2_id, @outcome, @id]
   SqlRunner.run(sql, values)
 end

 def delete()
   sql = "DELETE FROM battles WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def generate_result()
   if get_player1().power() > get_player2().power()
     @outcome = @player1_id
   elsif get_player1().power() < get_player2().power()
     @outcome = @player2_id
   else random = [@player1_id, @player2_id]
     @outcome = random.sample()
   end
 end



 def wins_list()
   sql = "SELECT outcome, COUNT(outcome) FROM battles GROUP BY outcome ORDER BY COUNT DESC"
   SqlRunner.run(sql, values)
 end



end
