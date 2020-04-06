class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.string :weight
      t.string :photo
      t.string :user_id
      t.timestamps
    end
    add_index :weights, :user_id
  end
end
