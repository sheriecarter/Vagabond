class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save

      login(@user)
      redirect_to user_path(@user)
    end
  else

    flash[:error]= @user.errors.full_messages
    render :new
  

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)

    if @user != current_user
      redirect_to user_path(@user)
    end
  end

  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)
    user.update_attributes(user_params)
    redirect_to user_path(user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :current_city, :email, :password)
  end

end
