require "rails_helper"

RSpec.describe "When creating a new review" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    @review1 = @shelter_1.reviews.create(title: "Great Shelter", rating: 4, content: "I had an amazing experience", pic: nil)
    @review2 = @shelter_1.reviews.create(title: "Amazing Rescue", rating: 5, content: "Super friendly staff", pic: "https://imgur.com/rjS5VMO")
  end

  it "can click a link to access a review form" do
    visit "/shelters/#{@shelter_1.id}"

    click_on "New Review"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/new_review")
    fill_in :title, with: "Lovely Animal care"
    fill_in :rating, with: 4
    fill_in :content, with: "I can't believe how good the shelter took care of my baby"
    expect(page).to have_field(:pic)
    click_on "Submit Review"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content("Lovely Animal care")
    expect(page).to have_content(4)
    expect(page).to have_content("I can't believe how good the shelter took care of my baby")
  end

  it "will give an error message to the user if the form isn't fully filled out" do
    visit "/shelters/#{@shelter_1.id}"

    click_on "New Review"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/new_review")
    fill_in :title, with: "Lovely Animal care"
    click_on "Submit Review"

    expect(page).to have_content("All fields except image must filled.")
  end
end
