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
end
