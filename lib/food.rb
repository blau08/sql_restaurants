class Food
  attr_reader(:name, :cost, :id, :restaurant_id, :rating)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @cost = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_singleton_method(:all) do |restaurant_id = nil|
    if restaurant_id == nil
      all_foods = DB.exec("SELECT * FROM foods;")
    else
      all_foods = DB.exec("SELECT * FROM foods WHERE restaurant_id=#{restaurant_id}")
    end
    foods = []
    all_foods.each() do |food|
      name = food.fetch('name')
      cost = food.fetch('cost')
      rating = food.fetch('rating').to_f()
      restaurant_id = food.fetch('restaurant_id').to_i()
      id = food.fetch('id').to_i()
      foods.push(Food.new({:name => name, :cost => cost, :rating => rating, :restaurant_id => restaurant_id, :id => id}))
    end
    foods
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO foods (name, cost, rating, restaurant_id) VALUES ('#{name}', '#{cost}', '#{rating}', '#{restaurant_id}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_food|
    self.name() == another_food.name() && cost() == another_food.cost() && rating() == another_food.rating() && restaurant_id() == another_food.restaurant_id()
  end

end
