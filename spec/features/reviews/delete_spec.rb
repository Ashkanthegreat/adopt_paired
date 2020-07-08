require 'rails_helper'

RSpec.describe "When I delete a review" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    @review_1 = @shelter_1.reviews.create(title: "Great Shelter", rating: 4, content: "I had an amazing experience", pic: nil)
    @review_2 = @shelter_1.reviews.create(title: "Amazing Rescue", rating: 5, content: "Super friendly staff", pic: "https://imgur.com/rjS5VMO")
  end

  it "should remove a review and route me to the shelter show page" do
    visit "/shelters/#{@shelter_1.id}"

    within("#review-#{@review_1.id}") do
      click_on "Delete Review"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to_not have_content("Great Shelter")
  end
end
