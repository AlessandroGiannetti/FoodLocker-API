class CreateFoodDays < ActiveRecord::Migration[6.0]
  def change
    create_table :food_days do |t|
      t.integer :meal
      t.references :food, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
