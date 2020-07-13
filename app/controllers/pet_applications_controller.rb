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
    applicant = Application.find(params["application_id"])
    pet.applications.to_a.delete_if {|a| a != applicant.id}
    pet.save
    redirect_to "/pets/#{pet.id}"
  end
end
