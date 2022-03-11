class CreatePetCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
