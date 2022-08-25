class Like < ApplicationRecord
  after_save :update_counter

  belongs_to :author, class_name: :User
  belongs_to :post

  def update_counter
    post.increment!(:likesCounter)
  end
end
