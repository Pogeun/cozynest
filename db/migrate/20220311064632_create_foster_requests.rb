class CreateFosterRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :foster_requests do |t|

      t.timestamps
    end
  end
end
