class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Log In WOO!"
      redirect_to @user
    else
      flash[:error] = "Uh Oh!  Spaghetti-Os"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id]=nil
    flash[:notice]= "Your'e Outta Here!"
    redirect_to root_path
  end

end
