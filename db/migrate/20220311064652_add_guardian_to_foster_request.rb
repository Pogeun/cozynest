class AddGuardianToFosterRequest < ActiveRecord::Migration[6.1]
  def change
    add_reference :foster_requests, :guardian, null: false, foreign_key: {to_table: :users}
  end
end
