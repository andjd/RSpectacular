class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :author_id
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
    add_index :user_comments, :author_id
    add_index :user_comments, :user_id
  end
end
