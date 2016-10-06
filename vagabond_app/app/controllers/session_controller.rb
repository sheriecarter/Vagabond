class SessionController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Log In WOO!"
      # redirect_to @user
    else
      flash[:error] = "Uh Oh!  Spaghetti-Os"
      redirect_to login_path
    end
  end

end
