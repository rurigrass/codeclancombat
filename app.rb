require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/battles_controller')
require_relative('controllers/players_controller')

get '/' do
  erb( :index )
end
