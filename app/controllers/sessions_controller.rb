class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate login_params['email'],
                             login_params['password']

    if user
      session[:user_id] = user.id
      flash[:success] = "You are now logged in"
      redirect_to login_path
    else
      flash[:danger] = 'Incorrect username of password'
      redirect_to login_path
    end
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
