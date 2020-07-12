class ApplicationsController < ApplicationController
  def new
    @favorites = favorites
    @pets = @favorites.map do |favorite|
      Pet.find(favorite)
    end
  end

  def create
    application = Application.create(app_params)

    params["pet"].each do |id|
      session[:favorites].delete(id.to_i)
      PetApplication.create(pet_id: id.to_i, application_id: application.id)
    end
    flash[:notice] = "You have successfully submitted your application"
    redirect_to "/favorites"
  end

  def show
    @application = Application.find(params[:id])
  end

  private

  def app_params
    params.permit(:name, :address, :city, :state, :zip, :phone_num, :description)
  end
end
