class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone = attributes.fetch(:phone)
    @id = attributes.fetch(:id, nil)
  end

  define_singleton_method(:all) do |id = nil|
    if id == nil
      returned_restaurants = DB.exec("SELECT * FROM restaurants ORDER BY name ASC;")
    else
      returned_restaurants = DB.exec("SELECT * FROM restaurants WHERE id=#{id} ORDER BY name ASC;")
    end
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch("name").gsub("''", "'")
      location = restaurant.fetch("location").gsub("''", "'")
      phone = restaurant.fetch("phone").gsub("''", "'")
      id = restaurant.fetch("id").to_i()
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone, :id => id}))
    end
    restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (name, location, phone) VALUES ('#{@name.gsub("'", "''")}', '#{@location.gsub("'", "''")}', '#{@phone.gsub("'", "''")}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:delete) do |id|
    returned_restaurants = DB.exec("DELETE FROM restaurants WHERE id=#{id};")
  end

  define_method(:==) do |another_restaurant|
    self.name() == another_restaurant.name() && location() == another_restaurant.location() && phone() == another_restaurant.phone()
  end

end
