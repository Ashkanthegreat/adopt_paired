require 'rails_helper'

RSpec.describe "Create a new shelter" do
  describe 'when I visit the shelter index page' do
    it "Can follow link to make new shelter" do
      visit '/shelters'

      expect(page).to_not have_content("Aviary Ambiance")

      click_on 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "Aviary Ambiance"
      fill_in :address, with: "654 Columbine ln"
      fill_in :city, with: "Dallas"
      fill_in :state, with: "Texas"
      fill_in :zip, with: 90654

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Aviary Ambiance")
    end

    it "will flash message if it fails to create a shelter" do
      visit '/shelters'

      expect(page).to_not have_content("Aviary Ambiance")

      click_on 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "Aviary Ambiance"
      fill_in :address, with: "654 Columbine ln"
      fill_in :city, with: "Dallas"
      fill_in :state, with: "Texas"

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters/new')
      expect(page).to have_content("All fields must be filled")
    end
  end
end
