class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.float :amount
      t.string :unit
      t.belongs_to :recipe, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
