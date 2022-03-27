class AddShelterToPet < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :shelter, null: false, foreign_key: {to_table: :users}
  end
end
