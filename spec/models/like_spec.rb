require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(name: 'ilham', photo: 'www.pp.com', bio: 'student from Morocco') }
  subject(:post) { Post.new(title: 'hello world', text: 'This is my first post', author: user) }
  subject(:like) { Like.new(author: user, post: post)}

  before { like.save }


  it 'should increment likescounter for post' do
    expect(like.post.likescounter).to eq(1)
  end
end
