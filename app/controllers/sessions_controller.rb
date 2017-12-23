class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    byebug
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :photos_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end
end
