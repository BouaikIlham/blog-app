require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(name: 'ilham', photo: 'www.pp.com', bio: 'student from Morocco') }
  subject(:post) { Post.new(title: 'hello world', text: 'This is my first post', author: user) }
  subject(:comment) { Comment.new(text: 'this my first comment', author: user, post: post) }

  before { comment.save }

  it 'should increment commentsCounter for post' do
    expect(comment.post.commentsCounter).to eq(1)
  end
end
