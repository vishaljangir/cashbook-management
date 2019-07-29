class AddUserIdToCashbookIndices < ActiveRecord::Migration[5.2]
  def change
    add_column :cashbook_indices, :user_id, :integer
  end
end
