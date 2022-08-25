class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments
  has_many :likes

  fter_save :update_counter

  def update_counter
    author.increment!(:postsCounter)
  end

  def recent_comments(_post)
    comments.order(created_at: :desc).limit(5)
  end
end
