class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end




  private
  def user_params
    params.require(:user).permit(:name, :current_city, :email, :password)
  end

end
