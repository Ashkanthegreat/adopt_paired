class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approx_age, :sex
  belongs_to :shelter

end
