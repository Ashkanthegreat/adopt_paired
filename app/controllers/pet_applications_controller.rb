class PetApplicationsController < ApplicationController
  def index
    pet = Pet.find(params["pet_id"])
    @applicants = pet.applications
  end

  def update
    pet = Pet.find(params[:pet_id])
    if pet.adoptability == true
      pet.adoptability = false
    else
      pet.adoptability = true
    end
    application = PetApplication.where(pet_id: params[:pet_id], application_id: params[:application_id]).first
    application.update(approved: true)
    pet.save
    app = Application.find(params[:application_id])
    if pet.adoptability == true
      redirect_to "/applications/#{app.id}"
    else
      redirect_to "/pets/#{pet.id}"
    end
  end

end
