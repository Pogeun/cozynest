class AddPetToFosterRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :foster_requests, :pet, null: false, foreign_key: true
  end
end
