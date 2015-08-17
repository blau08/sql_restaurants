require("spec_helper")
require("pry")

describe(Restaurant) do
  describe(".all") do
    it("returns empty") do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the restaurants") do
      test_restaurant = Restaurant.new({:name => "La Ristorante de Kyle", :location => "Outer Space", :phone => "503-000-4567"})
      test_restaurant.save()
      expect(Restaurant.all()).to(eq([test_restaurant]))
    end
  end

  describe(".delete") do
    it("deletes restaurant by id number") do
      test_restaurant = Restaurant.new({:name => "La Ristorante de Kyle", :location => "Outer Space", :phone => "503-000-4567"})
      test_restaurant.save()
      Restaurant.delete(test_restaurant.id())
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("displays the id of a restaurant after saving") do
      test_restaurant = Restaurant.new({:name => "La Ristorante de Kyle", :location => "Outer Space", :phone => "503-000-4567"})
      test_restaurant.save()
      print Restaurant.all()
      expect(test_restaurant.id()).to(be >= 1)
    end
  end
end

describe(Food) do
  describe(".all") do
    it("returns empty at first") do
      expect(Food.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("saves the restaurants") do
      test_food = Food.new({:name => 'Pizza', :cost => '$15-20', :rating => 10.0, :restaurant_id => 1})
      test_food.save()
      expect(Food.all()).to(eq([test_food]))
    end
  end
  describe(".delete") do
    it("deletes food by id number") do
      test_food = Food.new({:name => 'Pizza', :cost => '$15-20', :rating => 10.0, :restaurant_id => 1})
      test_food.save()
      Food.delete(test_food.id())
      expect(Food.all()).to(eq([]))
    end
  end
end
