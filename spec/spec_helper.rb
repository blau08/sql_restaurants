require('rspec')
require('food')
require('restaurant')
require('restaurants_spec')
require('pg')

DB = PG.connect({:dbname => 'restaurants'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurants *;")
    DB.exec("DELETE FROM foods *;")
  end
end
