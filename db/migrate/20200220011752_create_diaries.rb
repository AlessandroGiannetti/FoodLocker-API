class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :user_id

      t.timestamps
    end
    add_index :diaries, :user_id
  end
end
