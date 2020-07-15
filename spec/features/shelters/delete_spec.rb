require "rails_helper"

RSpec.describe "When I visit a shelter show page" do
  before :each do
    @shelter_1 = Shelter.create(name: "Habitat for Hippos", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    @shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)
    @pet_1 = @shelter_2.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F")
    @application_1 = Application.create(name: "Chandler",
        address: "134 Italy way",
        city: "Longmont",
        state: "CO",
        zip: "89767",
        phone_num: "7208765647",
        description: "Love em all")
   PetApplication.create(pet_id: @pet_1.id, application_id: @application_1.id)
  end

  it "I can delete a shelter from a show page" do

    visit "/shelters/#{@shelter_2.id}"

    expect(page).to have_content("Loving Arms")

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Loving Arms")
  end

  it "Can access destroy a shelter from the index page" do

    visit '/shelters'

    click_on "Delete #{@shelter_1.name}"

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Habitat for Hippos")
  end

  it "cannot delete a shelter if it has any pets with approved applications" do

    visit "/applications/#{@application_1.id}"

    within ".pet-#{@pet_1.id}" do
      click_on "Approve application"
    end


    visit "/shelters/#{@shelter_2.id}"
    click_on "Delete Shelter"

    expect(page).to have_content("This Sheleter Cannot Be Deleted!")

    expect(page).to have_content("Loving Arms")

  end
end
