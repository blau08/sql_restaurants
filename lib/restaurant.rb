class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch("name")
    @location = attributes.fetch("location")
    @phone = attributes.fetch("phone")
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurants;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch("name")
      location = restaurant.fetch("location")
      phone = restaurant.fetch("phone")
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone}))
    end
    restaurants
  end
end
