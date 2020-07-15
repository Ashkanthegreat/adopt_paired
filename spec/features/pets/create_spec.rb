require 'rails_helper'

RSpec.describe "When visiting the Pets Index page" do
  it "A button can be pressed to make a new pet" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F",
      adoptability: false)

    pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
      name: "Credence",
      description: "A little shy at first but I'm a cuddler once I get to know you",
      approx_age: 2,
      sex: "M",
      adoptability: true)

    pet_3 = shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      name: "Creole",
      description: "I don't like other animal but I love my person",
      approx_age: 4,
      sex: "M",
      adoptability: true)

      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_content("Gloria")

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in :image, with: "https://vignette.wikia.nocookie.net/godmodes/images/5/51/Moto_action.png/revision/latest?cb=20190309034710"
      fill_in :name, with: "Moto Moto"
      fill_in :description, with: "Moto moto likes you"
      fill_in :approx_age, with: "8"
      fill_in :sex, with: "M"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      expect(page).to have_content("Moto Moto")

  end

  it "will give an error if create info is imcomplete" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    visit "/shelters/#{shelter_1.id}/pets"

    click_on "Create Pet"

    fill_in :image, with: "https://vignette.wikia.nocookie.net/godmodes/images/5/51/Moto_action.png/revision/latest?cb=20190309034710"
    fill_in :name, with: "Moto Moto"
    fill_in :description, with: "Moto moto likes you"
    fill_in :approx_age, with: "8"

    click_on "Create Pet"
    expect(page).to have_content("All fields must be filled")
  end
end
