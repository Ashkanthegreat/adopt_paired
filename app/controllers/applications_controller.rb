class ApplicationsController < ApplicationController
  def new
    @favorites = favorites
    @pets = @favorites.map do |favorite|
      Pet.find(favorite)
    end
  end

  def create
    application = Application.new(app_params)

    if application.save
      params["pet"].each do |id|
        PetApplication.create(pet_id: id.to_i, application_id: application.id)
        session[:favorites].delete(id.to_i)
      end
      flash[:success] = "You have successfully submitted your application"
      redirect_to "/favorites"
    else
      flash[:errors] = application.errors.full_messages.to_sentence
      redirect_to "/applications/new"
    end

  end

  def show
    @application = Application.find(params[:id])
  end

  private

  def app_params
    params.permit(:name, :address, :city, :state, :zip, :phone_num, :description)
  end
end
