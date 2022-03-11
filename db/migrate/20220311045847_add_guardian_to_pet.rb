class AddGuardianToPet < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :guardian, foreign_key: {to_table: :users}
  end
end
