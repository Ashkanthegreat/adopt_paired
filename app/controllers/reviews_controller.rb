class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @review = @shelter.reviews.create(review_params)
    if @review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = "All fields except image must filled."
      redirect_to "/shelters/#{@shelter.id}/new_review"
    end
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :pic)
  end

end
