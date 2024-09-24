class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :content,     null: false, default: ""
      t.integer :comment_id, null: true, default: ""
      t.integer :post_id,    null: false, default: ""
      t.integer :user_id,    null: false, default: ""
      t.timestamps
    end
  end
end
