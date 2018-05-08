require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/battle.rb')


# READ battles
get '/battle_list' do
  @battles = Battle.all
  erb ( :"battles/index")
end

get '/battle_list/new' do
  @players = Player.all
  erb(:"battles/new")
end

get '/battle_list/edit/:id' do
  @players = Player.all
  erb(:"battles/edit")
end

# CREATE battle
get '/battle_list/new' do
  erb(:"battles/new")
end

post '/battle_list' do
  @battles = Battle.new(params)
  @battles.save()
  erb(:"battles/battle_added")
end

#UPDATE battle

get "/battle_list/edit/:id" do
  @battle = Battle.find(params[:id])
  erb(:"battles/edit")
end

post "/battle_list/edit/:id" do
  @battle = Battle.new(params)
  @battle.update
  redirect to '/battle_list'
end

#SHOW battle
get '/battle_list/:id' do
  @battle = Battle.find(params[:id])
  erb(:"battles/show")
end
