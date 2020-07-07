require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "lets user see all shelters" do
    shelter_1 = Shelter.create(name: "Habitat for Hippos")
    shelter_2 = Shelter.create(name: "Loving Arms")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
