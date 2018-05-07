require_relative('../models/player.rb')
require_relative('../models/battle.rb')

require('pry')

player1 = Player.new({
  "name" => "Ruri",
  "strength" => 2,
  "ability" => 5
  })

  player1.save()

player2 = Player.new({
  "name" => "Joe",
  "strength" => 4,
  "ability" => 1
  })

  player2.save()

battle1 = Battle.new({
  "player1_id" => player1.id,
  "player2_id" => player2.id,
  "outcome" => player1.name
  })

  battle1.save()

binding.pry
nil
