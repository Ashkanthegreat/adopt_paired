require 'rails_helper'

RSpec.describe "When I visit the favorites iindex page" do
  before :each do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    @pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F")

    @pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
      name: "Credence",
      description: "A little shy at first but I'm a cuddler once I get to know you",
      approx_age: 2,
      sex: "M")

    @pet_3 = shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      name: "Creole",
      description: "I don't like other animal but I love my person",
      approx_age: 4,
      sex: "M")
  end

  it "Will show all pets I've favorited" do
    visit "/pets/#{@pet_1.id}"

    click_on "Favorite this Pet"

    visit "/pets/#{@pet_2.id}"

    click_on "Favorite this Pet"

    visit "/favorites"
    expect(page).to have_content("Favorite Pets: 2")

    expect(current_path).to eq("/favorites")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_css("img[src='#{@pet_1.image}']")
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_css("img[src='#{@pet_2.image}']")
  end

  it "can click on favorites indicator on any page and it takes you to favorites index page" do

    visit "/pets/#{@pet_1.id}"

    click_on "Favorite this Pet"

    visit "/pets"

    click_on "Favorite Pets: 1"

    expect(current_path).to eq("/favorites")

  end

  it "will give a message if there are no pets favorited" do

    visit '/favorites'

    expect(page).to have_content("You have no favorited pets")
  end

  it "can see a list of pets with pending applications" do
    visit "/pets/#{@pet_1.id}"

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

    within("#appPend") do
      expect(page).to have_link("Gloria")
    end


  end
end
