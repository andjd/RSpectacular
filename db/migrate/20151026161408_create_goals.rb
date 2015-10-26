class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :target, null: false
      t.integer :user_id, null: false, index: true
      t.boolean :is_public, null: false
      t.boolean :is_completed, null: false

      t.timestamps null: false
    end
    add_index :goals, :is_public
  end
end
