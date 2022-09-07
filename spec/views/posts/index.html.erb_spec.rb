require 'rails_helper'
RSpec.describe 'posts/index.html.erb', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(id: 78, name: 'test', photo: 'photo/test', bio: 'this is index test', postsCounter: 4)
      @post1 = Post.create(id: 90, title: 'post title1', text: 'post text', author_id: 78, likescounter: 5)
      @post2 = Post.create(title: 'post title2', text: 'post text2', author_id: 78)
      @comment = Comment.create(text: 'this is comment test', post_id: 90, author_id: 78)
      get user_posts_path(@user)
      @page = response.body
    end
    it "shows user's name, picture and number of posts" do
      expect(@page).to have_content('test')
      expect(@page).to include('photo/test')
      expect(@page).to include('4')
    end

    it 'display the posts  text' do
      expect(@page).to include 'post text'
    end
    it 'displays first comment on a post and comments number' do
      expect(@page).to include @comment.text
      expect(@page).to include '1'
    end

    it 'displays number of likes and shows a post when clicked' do
      expect(@page).to include '5'
      expect(@post1.likescounter).to eql 5
      expect(@page).to include('/users/78/posts/90')
    end
  end
end
