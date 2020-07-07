require 'rails_helper'

RSpec.describe "When visiting the shelter pets index" do
  it "shows each pet's info that can be adopted from the shelter" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      approx_age: 5,
      sex: "F")

    pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
      name: "Credence",
      approx_age: 2,
      sex: "M")

    pet_3 = shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      name: "Creole",
      approx_age: 4,
      sex: "M")

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_css("img[src='#{pet_1.image}']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approx_age)
      expect(page).to have_content(pet_1.sex)

      expect(page).to have_css("img[src='#{pet_3.image}']")
      expect(page).to have_content(pet_3.name)
      expect(page).to have_content(pet_3.approx_age)
      expect(page).to have_content(pet_3.sex)
  end
end
