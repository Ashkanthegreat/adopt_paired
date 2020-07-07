require 'rails_helper'

RSpec.describe "Edit a shelter" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
  end

  it "I can edit a shelter's info on a show page" do

    visit '/shelters'

    click_on 'Habitat for Hippos'

    expect(page).to_not have_content("and Lemurs")

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

    fill_in :name, with: "Habitat for Hippos and Lemurs"
    fill_in :address, with: "184 w Plaintiff rd"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: 80504

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content("Habitat for Hippos and Lemurs")

  end

  it "A link to the edit page is on every shelter in the index" do

    visit '/shelters'

    click_on "Edit #{@shelter_1.name}"
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end

end
