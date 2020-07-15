class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def avg_rating
    sum = reviews.sum do |review|
      review.rating.to_f
    end
    if reviews.count > 0
      sum/reviews.count
    else
      "N/A"
    end
  end

  def applications_count
    pets.sum do |pet|
      pet.applications.count
    end
  end

end
