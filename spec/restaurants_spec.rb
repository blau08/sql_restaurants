require("spec_helper")

describe(Restaurant) do
  describe(".all") do
    it("returns empty") do
      expect(Restaurant.all()).to(eq([]))
    end
  end
end
