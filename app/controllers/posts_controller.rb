class PostsController < ApplicationController

  def index
    @posts = Post.all
    if !admin
      redirect_to root_path
    end
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
    if !current_user
      redirect_to posts_path
    elsif !@city
      redirect_to user_path(current_user)
    end
  end

  def create
  current_city = City.find_by_id(params[:city_id])
    if !current_user
      redirect_to login_path
    elsif !current_city
      redirect_to user_path(current_user)
    else
      @post = Post.new(post_params)
      if @post.save

        current_user.posts << @post if current_user
        current_city.posts << @post if current_city

        redirect_to city_post_path(current_city,@post)
      else
        flash[:error]= @post.errors.full_messages
        redirect_to new_city_post_path(current_city)
      end
    end
  end

  def show
  @post = Post.find_by_id(params[:id])
  @user = User.find_by_id(@post.user_id)
  @city = City.find_by_id(@post.city_id)
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

  def update
    post_id = params[:id]
    current_city = City.find_by_id(params[:city_id]) || nil
    @post = Post.find_by_id(post_id)
    if @post.update_attributes(post_params)
     if current_city
       redirect_to city_post_path(current_city, @post)
     else
       redirect_to post_path(@post)
     end

   else
     flash[:error]= @post.errors.full_messages
     render :edit
   end
  end

  def destroy
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
    current_city = City.find_by_id(params[:city_id])
    @post.delete
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
