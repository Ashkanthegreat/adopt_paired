class ApplicationsController < ApplicationController
  def new
    @favorites = favorites
    @pets = @favorites.map do |favorite|
      Pet.find(favorite)
    end
  end

  def create
    params["pet"].each do |id|
      session[:favorites].delete(id.to_i)
    end
    flash[:notice] = "You have successfully submitted your application"
    redirect_to "/favorites"
  end
end
