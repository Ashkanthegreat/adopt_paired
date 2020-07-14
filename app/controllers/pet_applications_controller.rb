class PetApplicationsController < ApplicationController
  def index
    pet = Pet.find(params["pet_id"])
    @applicants = pet.applications
  end

  def update
    pet = Pet.find(params[:pet_id])
    if pet.adoptability == true
      pet.adoptability = false
    end
    application = PetApplication.where(pet_id: params[:pet_id], application_id: params[:application_id]).first
    application.update(approved: true)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end
end
