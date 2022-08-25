class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments
  has_many :likes
  validates :title, presence: true
  validates :bio, length: { maximum: 250 }
  validates :commentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  fter_save :update_counter

  def update_counter
    author.increment!(:postsCounter)
  end

  def recent_comments(_post)
    comments.order(created_at: :desc).limit(5)
  end
end
