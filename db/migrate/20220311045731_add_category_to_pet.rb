class AddCategoryToPet < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :category, null: false, foreign_key: {to_table: :pet_categories}
  end
end
