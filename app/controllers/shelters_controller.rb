class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
     @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.pets.each do |pet|
      pet.pet_applications.find_all do |pet_app|
        if pet_app.approved == true
          flash[:notice] = "This Sheleter Cannot Be Deleted!"
          redirect_to "/shelters/#{shelter.id}" and return
        end
      end
    end
      Shelter.destroy(params[:id])
      redirect_to "/shelters"
  end


  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
