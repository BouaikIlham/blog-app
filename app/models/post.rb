class Post < ApplicationRecord
  after_save :update_counter

  belongs_to :author, class_name: :User
  has_many :comments
  has_many :likes
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_counter
    author.increment!(:postsCounter)
  end

  def recent_comments(_post)
    comments.order(created_at: :desc).limit(5)
  end
end
