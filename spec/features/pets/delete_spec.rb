require 'rails_helper'

RSpec.describe "When deleting a pet" do
  before :each do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)

    @pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F")
  end

  it "has a link to destroy that pet on show page" do

      visit "/pets/#{@pet_1.id}"
      expect(page).to have_content("Gloria")

      click_on "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Gloria")
  end

  it "has a link to destroy a pet on the index page" do

    visit '/pets'

    click_on "Delete #{@pet_1.name}"
    expect(current_path).to eq('/pets')
    expect(page).to_not have_content("Gloria")
  end
end
