require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(name: 'ilham', photo: 'www.pp.com', bio: 'student from Morocco') }
  subject(:post) { Post.new(title: 'hello world', text: 'This is my first post', author: user) }

  before { post.save }

  it 'post title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'commentsCounter must be integer greater than or equal zero' do
    post.commentsCounter = -2
    expect(post).to_not be_valid
  end

  it 'likesCounter must be integer greater than or equal zero' do
    post.likescounter = -2
    expect(post).to_not be_valid
  end
  it 'title must not exceed 250 characters' do
    post.title = 'orem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes,
    nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium q'
    expect(post).to_not be_valid
  end

  it 'should increment postcounter for author' do
    expect(post.author.postsCounter).to eq(1)
  end
  it 'should return 5 recent comments' do
    6.times do |i|
      Comment.create(text: "test comment #{i}", post: post, author: user)
    end
    expect(post.last_five_comment.length).to eq 5
  end
end
