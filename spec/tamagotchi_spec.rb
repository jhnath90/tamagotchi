require("rspec")
require("tamagotchi")

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("dog")
      expect(my_pet.name()).to(eq("dog"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("dog")
      expect(my_pet.is_alive()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_food_level(0)
      expect(my_pet.is_alive()).to(eq(false))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("dog")
      my_pet.time_passes()  #deciding how to make time pass can be tricky
      expect(my_pet.food_level()).to(eq(9))
      expect(my_pet.activity_level()).to(eq(9))
    end
  end

  describe("#set_sleep_level") do
    it("changes the sleep level of the Tamagotchi")  do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_sleep_level(5)
      expect(my_pet.sleep_level()).to(eq(5))
    end

    it("will not change if greater than max level") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_sleep_level(15)
      expect(my_pet.sleep_level()).to(eq(10))
    end
  end

  describe("#set_activity_level") do
    it("changes the activity level of the Tamagotchi")  do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_activity_level(5)
      expect(my_pet.activity_level()).to(eq(5))
    end
  end

  describe("#is_happy") do
    it("is happy if the activity level is above 5") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_activity_level(5)
      expect(my_pet.is_happy()).to(eq(true))
    end
    it("is not happy if the activity level is below 5") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_activity_level(2)
      expect(my_pet.is_happy()).to(eq(false))
    end
  end

  describe("#is_tired") do
    it("takes nap when sleep level is below or equal to 3") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_sleep_level(2)
      expect(my_pet.is_tired()).to(eq(true))
    end

    it("is not tired when sleep level is above 3") do
      my_pet = Tamagotchi.new("dog")
      my_pet.set_sleep_level(9)
      expect(my_pet.is_tired()).to(eq(false))
    end
  end
end