class SheltersPetsController< ApplicationController
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
    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    else
      flash[:notice] = "All fields must be filled."
      redirect_to "/shelters/#{shelter.id}/pets/new"
    end
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approx_age, :sex)
  end
end
