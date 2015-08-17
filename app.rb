require('./lib/food')
require('./lib/restaurant')
require('sinatra')
require('sinatra/reloader')
require('pg')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
