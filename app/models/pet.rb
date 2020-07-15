class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approx_age, :sex
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications
  belongs_to :shelter

end
