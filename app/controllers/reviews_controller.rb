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
      redirect_to "/shelters/#{@shelter.id}/reviews/new"
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    shelter = Shelter.find(params[:id])
    Review.update(review_params)
    redirect_to "/shelters/#{shelter.id}"

  end

  def destroy
    Review.destroy(params[:review_id])
    shelter = Shelter.find(params[:id])
    redirect_to "/shelters/#{shelter.id}"
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :pic)
  end

end
