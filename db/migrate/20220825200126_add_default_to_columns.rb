class AddDefaultToColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :postsCounter, :integer, default: 0
    change_column :posts, :commentsCounter, :integer, default: 0
    change_column :posts, :likescounter, :integer, default: 0
  end
end
