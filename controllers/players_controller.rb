require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/player.rb')

# READ players
  get '/player_list' do
    @players = Player.all()
    erb(:"players/index")
  end

# CREATE player
  get '/player_list/new' do
    erb(:"players/new")
  end
