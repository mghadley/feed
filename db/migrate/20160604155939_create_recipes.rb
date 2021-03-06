class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :hours, default: 0
      t.integer :minutes, default: 0
      t.string :difficulty
      t.string :category
      t.string :food_type
      t.text :instructions
      t.integer :likes, default: 0
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
