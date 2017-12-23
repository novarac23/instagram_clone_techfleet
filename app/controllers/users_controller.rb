class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    
    if user.save
      #TODO redirect to photos index page
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
