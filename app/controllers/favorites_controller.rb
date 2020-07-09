class FavoritesController < ApplicationController
  def update
    @pet = Pet.find(params[:pet_id])
    session[:favorites] ||= Array.new()
    session[:favorites] << @pet.id
    session[:favorites].uniq
    flash[:notice] = "#{@pet.name} has been added to your favorites list"
    redirect_to "/pets/#{@pet.id}"
  end
end
