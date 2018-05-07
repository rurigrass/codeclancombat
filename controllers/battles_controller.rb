require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/battle.rb')

get '/battle_list' do
  @battles = Battle.all
  erb ( :"battles/index")
end
