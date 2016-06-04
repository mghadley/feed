class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.time :duration
      t.string :difficulty
      t.string :category
      t.string :food_type
      t.text :instructions
      t.integer :likes
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
