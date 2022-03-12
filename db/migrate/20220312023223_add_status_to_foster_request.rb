class AddStatusToFosterRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :foster_requests, :status, :integer, default: 0
  end
end
