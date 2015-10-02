require("sinatra")
require("sinatra/reloader")
require("./lib/tamagotchi")
also_reload("lib/**/*.rb")

get("/") do
  erb(:index)
end

post("/tamagotchi") do
  if params["name"]
    name = params.fetch("name")
    @@my_pet = Tamagotchi.new(name)
  end
  erb(:tamagotchi)
end

get("/tamagotchi") do
  @@my_pet.time_passes()
  erb(:tamagotchi)
end

post("/feed") do
  @@my_pet.set_food_level(@@my_pet.food_level().+(1))
  erb(:tamagotchi)
end

post("/play") do
  @@my_pet.set_activity_level(@@my_pet.activity_level().+(1))
  erb(:tamagotchi)
end

post("/sleep") do
  @@my_pet.set_sleep_level(@@my_pet.sleep_level().+(1))
  erb(:tamagotchi)
end


