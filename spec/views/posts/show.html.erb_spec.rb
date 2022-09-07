require 'rails_helper'
RSpec.describe 'posts/show.html.erb', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(id: 1, name: 'username test', photo: 'photo/test', bio: 'this is index test', postsCounter: 4)
      @post1 = Post.create(id: 1, title: 'title1', text: 'text', author_id: 1, likescounter: 5)
      @comment = Comment.create(text: 'this is comment test', post_id: 1, author_id:1)
      get user_post_path(@user, @post1)
      @page = response.body
    end
    it "display author name" do
      expect(@page).to include(@user.name)
    end

    it 'display the number of comments and likes' do
      expect(@page).to include('1')
      expect(@page).to include('5')
    end

    it 'dispalays the post body (text)' do
      expect(@page).to include(@post1.text)
    end

    it 'displays comment owner and comment body (text)' do
      expect(@page).to include(@comment.author.name)
      expect(@page).to include(@comment.text)
      expect(@page).to include('this is comment test')
      expect(@page).to include('username test')
    end
  end
end
