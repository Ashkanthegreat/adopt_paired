require "rails_helper"

RSpec.describe "When I visit a shelter show page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    @shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)
  end

  it "I can delete a shelter from a show page" do

    visit "/shelters/#{@shelter_2.id}"

    expect(page).to have_content("Loving Arms")

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Loving Arms")
  end

  it "Can access destroy a shelter from the indew page" do

    visit '/shelters'

    click_on "Delete #{@shelter_1.name}"
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Habitat for Hippos")
  end
end
