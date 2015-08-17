require('rspec')
require('food')
require('restaurant')
require('pg')

DB = PG.connect({:dbname => 'restaurants_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurants *;")
    DB.exec("DELETE FROM foods *;")
  end
end
