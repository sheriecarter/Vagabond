class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
  end

  def create
    @post = Post.create(post_params)
    current_city = City.find_by_id(params[:city_id])
    current_user.posts << @post
    current_city.posts << @post if current_city

    redirect_to city_post_path(current_city,@post)
  end

  def show
  @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(@post.user_id)
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

  def update
    post_id = params[:id]
    current_city = City.find_by_id(params[:city_id]) || nil
    post = Post.find_by_id(post_id)
    post.update_attributes(post_params)
     if current_city
       redirect_to city_post_path(current_city, post)
     else
       redirect_to post_path(post)
     end
  end

  def destroy
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
    current_city = City.find_by_id(params[:city_id])
    @post.delete
    p current_city
    p "***************************"
    user_id = current_user.id
    if params[:city_id]
      redirect_to city_path(params[:city_id])
    else
      redirect_to user_path(user_id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
