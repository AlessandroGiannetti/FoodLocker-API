class CreateSportDays < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_days do |t|
      t.integer :hour
      t.references :sport, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
