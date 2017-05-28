class PostsController < ApplicationController
  # all posts on index page
  def index
  end

# create new post
  def new
  end

# saving post to database
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
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
