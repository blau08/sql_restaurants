class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone = attributes.fetch(:phone)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurants ORDER BY name ASC;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch("name")
      location = restaurant.fetch("location")
      phone = restaurant.fetch("phone")
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone}))
    end
    restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (name, location, phone) VALUES ('#{@name}', '#{@location}', '#{@phone}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:delete) do |id|
    returned_restaurants = DB.exec("DELETE FROM restaurants WHERE id=#{id};")
  end

  define_method(:==) do |another_restaurant|
    self.name() == another_restaurant.name() && location() == another_restaurant.location() && phone() == another_restaurant.phone()
  end

end
