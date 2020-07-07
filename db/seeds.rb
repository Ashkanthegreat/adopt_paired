# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
Pet.destroy_all

shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
  name: "Gloria",
  description: "682 lbs of hugs and love",
  approx_age: 5,
  sex: "F")

shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
  name: "Credence",
  description: "A little shy at first but I'm a cuddler once I get to know you",
  approx_age: 2,
  sex: "M")

shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
  name: "Creole",
  description: "I don't like other animal but I love my person",
  approx_age: 4,
  sex: "M")
