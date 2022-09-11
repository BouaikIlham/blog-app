class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
        else
          render :new
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)  
    post.comments.destroy_all if post.comments.any?
    post.destroy
    if user.save
      redirect_to user_posts_path, notice: 'Post was successfully deleted.'
    else
      render :new, alert: 'Error can not delete this post,try again'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :likescounter, :commentsCounter)
  end
end
