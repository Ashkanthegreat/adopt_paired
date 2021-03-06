class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @name = @pet.pet_applications.find_by(approved: true).application if
    !@pet.pet_applications.find_by(approved: true).nil?
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      redirect_to "/pets/#{pet.id}"
    else
      flash[:notice] = "All fields must be filled."
      redirect_to "/pets/#{pet.id}/edit"
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    session[:favorites].delete(pet.id)
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private
  def pet_params
    params.permit(:image, :name, :description, :approx_age, :sex)
  end
end
