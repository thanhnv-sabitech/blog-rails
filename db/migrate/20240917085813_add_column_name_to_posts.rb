class AddColumnNameToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :user_id, :integer, null: false, default: 0
    add_column :posts, :status,  :integer, null: false, default: 0
  end
end
