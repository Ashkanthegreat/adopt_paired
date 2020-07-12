class PetApplicationsController < ApplicationController
  def index
    pet = Pet.find(params["pet_id"])
    @applicants = pet.applications
  end
end
