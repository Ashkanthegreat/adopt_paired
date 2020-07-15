require "rails_helper"

RSpec.describe "shelters show page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    @review1 = @shelter_1.reviews.create(title: "Great Shelter", rating: 4, content: "I had an amazing experience", pic: nil)
    @review2 = @shelter_1.reviews.create(title: "Amazing Rescue", rating: 5, content: "Super friendly staff", pic: "https://imgur.com/rjS5VMO")
  end
  it "shows the shelter's name, address, city, state, and zip for a specific shelter" do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
  end

  it "can see a list of reviews with title, rating, content, optional pic" do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review2.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review2.rating)
    expect(page).to have_content(@review1.content)
    expect(page).to have_content(@review2.content)
    expect(page).to have_css("img[src='#{@review2.pic}']")
  end

  it "can see a link to edit each review" do

    visit "/shelters/#{@shelter_1.id}"

    within("#review-#{@review1.id}") do
      click_on "Edit Review"
    end

    fill_in :title, with: "Title change"
    fill_in :rating, with: 5
    fill_in :content, with: "Content Change"
    click_on "Update Review"
    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

    within("#review-#{@review1.id}") do
     expect(page).to have_content("Title change")
     expect(page).to have_content(5)
     expect(page).to have_content("Content Change")
     expect(page).to_not have_content("Great Shelter")
   end
  end

  it "sees a flash message when I am trying to edit a review and I don't fill in all field, except pic" do
    visit "/shelters/#{@shelter_1.id}"

    within("#review-#{@review1.id}") do
      click_on "Edit Review"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/#{@review1.id}/edit")

    fill_in :title, with: "Title change"
    fill_in :rating, with: 5
    click_on "Update Review"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/#{@review1.id}/edit")


    expect(page).to have_content("All fields except image must filled.")
  end

  it 'Can click on the shelters name and it will take you to the shelters show page' do

    visit "/shelters/#{@shelter_1.id}"

    click_on "Habitat for Hippos"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

  end   
  it "has statistics on the show page regarding reviews and applications" do
    @pet_1 = @shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
    name: "Gloria",
    description: "682 lbs of hugs and love",
    approx_age: 5,
    sex: "F")

    @pet_3 = @shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    name: "Creole",
    description: "I don't like other animal but I love my person",
    approx_age: 4,
    sex: "M")

    @application_1 = Application.create(name: "Chandler",
    address: "134 Italy way",
    city: "Longmont",
    state: "CO",
    zip: "89767",
    phone_num: "7208765647",
    description: "Love em all")

    PetApplication.create(pet_id: @pet_1.id, application_id: @application_1.id)

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content("Rating: 4.5")
    expect(page).to have_content("Pets: 2")
    expect(page).to have_content("Applications: 1")
  end
end
