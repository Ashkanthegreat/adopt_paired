require 'rails_helper'

RSpec.describe "When I visit the pets index" do
  it "I can see each pet that is adoptable" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      approx_age: 5,
      sex: "F")

      visit "/pets"

    expect(page).to have_css("img[src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approx_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter.name)
  end
end
