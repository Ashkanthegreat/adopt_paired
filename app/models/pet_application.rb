class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  # def self.someshit
  #   self.find_by(pet_id: params[:pet_id], application_id: params[:application_id])
  # end

end
