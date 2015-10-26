class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :author_id
      t.integer :goal_id
      t.text :comment

      t.timestamps null: false
    end
    add_index :goal_comments, :author_id
    add_index :goal_comments, :goal_id
  end
end
