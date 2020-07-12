require 'rails_helper'

RSpec.describe "When I visit a new application page" do
  before :each do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    @pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F",
      adoptability: false)

    @pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
      name: "Credence",
      description: "A little shy at first but I'm a cuddler once I get to know you",
      approx_age: 2,
      sex: "M",
      adoptability: true)

    @pet_3 = shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      name: "Creole",
      description: "I don't like other animal but I love my person",
      approx_age: 4,
      sex: "M",
      adoptability: true)
  end

  it "I can select which favorited pets I want to apply for" do
    visit "/pets/#{@pet_1.id}"

    click_on "Favorite this Pet"

    visit "/pets/#{@pet_2.id}"

    click_on "Favorite this Pet"

    visit "/favorites"

    click_on "Apply for a new friend!"
    expect(current_path).to eq('/applications/new')

    within ".Gloria" do
      check "pet[]"
    end

    fill_in :name, with: "Chandler"
    fill_in :address, with: "134 Iron rd"
    fill_in :city, with: "Mead"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80542"
    fill_in :phone_num, with: "7206567856"
    fill_in :description, with: "I love me some hippos"
    click_on "Submit Application"

    expect(current_path).to eq("/favorites")
    expect(page).to have_content("You have successfully submitted your application")
    expect(page).to_not have_content("Gloria")

  end
end
