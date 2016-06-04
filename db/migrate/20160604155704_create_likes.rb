class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :recipe_id
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
