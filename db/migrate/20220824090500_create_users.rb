class CreateUers < ActiveRecord::Migration[7.0]
  def change
    create_table :uers do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :postsCounter

      t.timestamps
    end
  end
end
