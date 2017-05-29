class PostsController < ApplicationController
  # all posts on index page - ordered newest to oldest
  def index
    @posts = Post.all.order('created_at DESC')
  end

# create new post
  def new
    @post = Post.new
  end

# saving post to database if validated, else re-render new post form
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # Using strong params - define which parameters you will accept
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
