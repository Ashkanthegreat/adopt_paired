class AddFieldToPetApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :pet_applications, :approved, :boolean, :default => false
  end
end
