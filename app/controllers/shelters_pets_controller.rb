class SheltersPetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approx_age, :sex)
  end
end
