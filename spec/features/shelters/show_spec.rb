require "rails_helper"

RSpec.describe "shelters show page" do
  it "shows the shelter's name, address, city, state, and zip for a specific shelter" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
