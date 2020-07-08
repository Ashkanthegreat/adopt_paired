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
    review = Review.find(params[:review_id])
    shelter = Shelter.find(params[:id])
    if review.update(review_params)
      redirect_to "/shelters/#{shelter.id}"
    else
      flash[:notice] = "All fields except image must filled."
      redirect_to "/shelters/#{shelter.id}/#{review.id}/edit"
    end
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
