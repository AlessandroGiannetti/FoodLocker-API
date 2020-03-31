class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :photo
      t.string :user_id
      t.integer :likes
      t.timestamps
    end
    add_index :posts, :user_id
  end
end
