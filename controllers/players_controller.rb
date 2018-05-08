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

  post '/player_list' do
    @players = Player.new(params)
    @players.save()
    erb(:"players/player_added")
  end

  # UPDATE player

  get "/player_list/edit/:id" do
    @player = Player.find(params[:id])
    erb(:"players/edit")
  end

  post "/player_list/edit/:id" do
    @player = Player.new(params)
    @player.update
    redirect to '/player_list'
  end

  # SHOW player

  get '/player_list/:id' do
    @player = Player.find(params[:id])
    erb(:"players/show")
  end

  # DELETE player

  post '/player_list/delete/:id' do
    player = Player.find(params[:id])
    player.delete
    redirect to '/player_list'
  end
