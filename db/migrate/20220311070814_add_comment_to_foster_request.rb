class AddCommentToFosterRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :foster_requests, :comment, :text
  end
end
