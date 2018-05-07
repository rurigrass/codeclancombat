require('sinatra')
require('sinatra/contrib/all')
require('pry')
require('../models/player.rb')

# READ players
  get '/player_list' do
    @players = Player.all()
    erb(:"players/index")
  end
