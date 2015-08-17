require("spec_helper")

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
end
