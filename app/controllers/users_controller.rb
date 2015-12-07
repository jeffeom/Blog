class UsersController < ApplicationController
  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   user_params = params.require(:user).permit(:first_name, :last_name, :email,
  #                                              :password, :password_confirmation)
  #   @user = User.new user_params
  #   if @user.save
  #     session[:user_id] = @user_id
  #     redirect_to root_path, notice: "Acount Created!"
  #   else
  #     render :new
  #   end
  # end

  def show
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      @user = User.find params[:id]
      @favourites = @user.favourites
    else
      redirect_to new_user_session_path, alert:"Log in Please!"
    end
  end
end
