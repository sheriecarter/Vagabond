class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    current_user.posts << @post
    City.find_by_id(1).posts << @post

    redirect_to city_post_path(1,@post)
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

  def update
    post_id = params[:id]
    post = Post.find_by_id(post_id)
    post.update_attributes(post_params)
    redirect_to post_path(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
