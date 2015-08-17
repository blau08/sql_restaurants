require('./lib/food')
require('./lib/restaurant')
require('sinatra')
require('sinatra/reloader')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "restaurants"})

get('/') do
  @restaurants = Restaurant.all()
  erb(:index)
end

post('/restaurant/new') do
  name = params.fetch('name')
  location = params.fetch('location')
  phone = params.fetch('phone')
  Restaurant.new({:name => name, :location => location, :phone => phone}).save()
  @success_message = "#{name} has been added."
  @restaurants = Restaurant.all()
  erb(:index)
end
