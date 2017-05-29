class PostsController < ApplicationController
  # from devise - authenticate users before viewing anything besides index, show
  before_action :authenticate_user!, except: [:index, :show]

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

  #update post or re-render edit view form
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  # Using strong params - define which parameters you will accept
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

end
