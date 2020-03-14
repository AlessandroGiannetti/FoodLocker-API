class CreateExtrainfos < ActiveRecord::Migration[6.0]
  def change
    create_table :extrainfos do |t|
      t.integer :age
      t.string :gender
      t.string :height
      t.string :weight
      t.string :target_weight
      t.integer :water
      t.integer :sport_time
      t.integer :daily_kcal
      t.integer :user_id

      t.timestamps
    end
    add_index :extrainfos, :user_id
  end
end
