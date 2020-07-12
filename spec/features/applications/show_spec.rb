require "rails_helper"

RSpec.describe "When I visit an application's show page" do
  before :each do
    shelter_1 = Shelter.create(name: "Habitat for Hippos and Lemurs", address: "184 w Plaintiff rd", city: "Denver", state: "CO", zip: 80504)
    shelter_2 = Shelter.create(name: "Loving Arms", address: "234 Lugie rd", city: "Montrose", state: "AR", zip: 90876)

    @pet_1 = shelter_1.pets.create(image: "https://resize.hswstatic.com/w_907/gif/hippo-sunscreen.jpg",
      name: "Gloria",
      description: "682 lbs of hugs and love",
      approx_age: 5,
      sex: "F",
      adoptability: false)

    @pet_2 = shelter_2.pets.create(image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/01/12201051/cute-puppy-body-image.jpg",
      name: "Credence",
      description: "A little shy at first but I'm a cuddler once I get to know you",
      approx_age: 2,
      sex: "M",
      adoptability: true)

    @pet_3 = shelter_1.pets.create(image: "https://images.unsplash.com/photo-1531338410663-88d33379ba03?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
      name: "Creole",
      description: "I don't like other animal but I love my person",
      approx_age: 4,
      sex: "M",
      adoptability: true)

    @application_1 = Application.create(name: "Chandler",
      address: "134 Italy way",
      city: "Longmont",
      state: "CO",
      zip: "89767",
      phone_num: "7208765647",
      description: "Love em all")

    PetApplication.create(pet_id: @pet_1.id, application_id: @application_1.id)
    PetApplication.create(pet_id: @pet_2.id, application_id: @application_1.id)
  end

  it "I can see info and all pet's in the application" do
    visit "/applications/#{@application_1.id}"

    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_1.address)
    expect(page).to have_content(@application_1.city)
    expect(page).to have_content(@application_1.state)
    expect(page).to have_content(@application_1.zip)
    expect(page).to have_content(@application_1.phone_num)
    expect(page).to have_content(@application_1.description)
    expect(page).to have_content("Gloria")
    expect(page).to have_content("Credence")
    click_on "Gloria"
    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end
end
