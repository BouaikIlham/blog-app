class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.integer :likescounter
      t.integer :author_id

      t.timestamps
    end
    add_foreign_key :posts, :users, column: :author_id
  end
end
