class FavoritesController < ApplicationController
  def index
    @favorites = favorites
    @pets = Pet.all
  end

  def update
    @pet = Pet.find(params[:pet_id])
    session[:favorites] ||= Array.new()
    session[:favorites] << @pet.id
    session[:favorites].uniq
    flash[:notice] = "#{@pet.name} has been added to your favorites list"
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    @pet = Pet.find(params[:pet_id])
    session[:favorites].delete(@pet.id)
    flash[:notice] = "#{@pet.name} removed from favorites"
    redirect_to request.referrer
  end

  def destroy_all
    session[:favorites].clear
    redirect_to "/favorites"
  end


  private

  def favorites
    session[:favorites].to_a.map do |id|
      Pet.find(id)
    end
  end

end
