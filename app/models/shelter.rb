class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews 

end
