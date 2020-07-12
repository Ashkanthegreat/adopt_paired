# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all

shelter_1 = Shelter.create(name: "Accumula Town Pokemon House", address: "271 Snivy Lane", city: "Accumula", state: "UV", zip: 80504)
shelter_2 = Shelter.create(name: "Cerulean City Pokedex", address: "1444 Bulbasaur Drive", city: "Cerulean City", state: "KT", zip: 90876)
shelter_3 = Shelter.create(name: "Ecruteak Pokemon Shelter", address: "19 Delibird St", city: "Ecruteak City", state: "JT", zip: 10122)

shelter_1.pets.create(image: "https://e7.pngegg.com/pngimages/999/1014/png-clipart-pokemon-x-and-y-pokemon-battle-revolution-pansage-pokemon-go-others-mammal-leaf.png",
  name: "Pansage",
  description: "This cheeky guy is a awesome partner for all your berry hunting trips",
  approx_age: 5,
  sex: "M")

shelter_2.pets.create(image: "https://attackofthefanboy.com/wp-content/uploads/2019/03/Pokemon-GO-How-to-Catch-Shiny-Machop-and-Mankey.jpg",
  name: "Machop",
  description: "This tough little guys muscles never get sore.  He is shiny and super rare, but no one has been able to get him.  Remember, a Pokemon has to choose you!",
  approx_age: 2,
  sex: "M")

shelter_1.pets.create(image: "https://gamepress.gg/pokemongo/sites/pokemongo/files/2019-06/613_0.png",
  name: "Cubchoo",
  description: "All Cubchoo needs is lots of love to evolve into a powerfull Pokemon",
  approx_age: 1,
  sex: "F")

shelter_2.pets.create(image: "https://db.pokemongohub.net/images/official/full/092.png",
  name: "Gastly",
  description: "This ghost type Pokemon is hard to catch, but well worth it once she's yours!",
  approx_age: 3,
  sex: "F")

shelter_3.pets.create(image: "https://img.rankedboost.com/wp-content/uploads/2016/08/Larvitar-Pokemon-Go.png",
  name: "Larvitar",
  description: "Born underground, this Pokemon is likes to spend all her time there.",
  approx_age: 3,
  sex: "F")

shelter_3.pets.create(image: "https://static.pokemonpets.com/images/monsters-images-800-800/2239-Shiny-Elekid.png",
  name: "Elekid",
  description: "Don't let this Pokemon's size fool you. One touch from him, and you'll never see things the same!",
  approx_age: 1,
  sex: "M")
