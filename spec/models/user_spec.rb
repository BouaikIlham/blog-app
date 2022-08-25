require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'ilham', photo: 'www.pp.com', bio: 'student from Morocco') }

  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter must be integer greater than or equal zero' do
    user.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'postCounter must be integer greater than or equal zero' do
    user.postsCounter = 0
    expect(user).to be_valid
  end

  it 'should list three recent posts' do
    4.times do |i|
      Post.create(title: 'Hello', text: "This is my #{i}th post", commentsCounter: 0, likescounter: 0,
                  author: user)
    end
    expect(subject.three_recent_posts.length).to eq 3
  end
end
