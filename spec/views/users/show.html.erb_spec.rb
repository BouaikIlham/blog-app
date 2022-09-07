require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(id: 1,name: 'test', photo: 'photo/test', bio: 'this is show test', postsCounter: 4)
      @post1 = Post.create(title: 'post title1', text: 'post text', author_id: 1)
      @post2 = Post.create(title: 'post title2', text: 'post text2', author_id: 1)
      @post3 = Post.create(title: 'post title3', text: 'post text3', author_id: 1)
      get user_path(@user)
      @page = response.body
    end
    it "shows user's name, picture, bio and number of posts" do
      expect(@page).to include(@user.photo)
      expect(@page).to include(@user.name)
      expect(@page).to include(@user.bio)
      expect(@page).to include(@user.postsCounter.to_s)
    end

    it 'display the user last 3 posts' do
      expect(@user.posts).to include @post1, @post2, @post3
      expect(@page).to include 'post text'
      expect(@page).to include 'post text2'
      expect(@page).to include 'post text3'
    end

    it 'dispaly see all posts button ' do
      expect(@page).to include 'see all posts'
    end
  end
end
