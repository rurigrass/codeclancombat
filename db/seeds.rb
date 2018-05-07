require_relative('../models/player.rb')

require('pry')

player1 = Player.new({
  "name" => "Ruri",
  "strength" => 2,
  "ability" => 5,
  })

  player1.save()


binding.pry
nil 
