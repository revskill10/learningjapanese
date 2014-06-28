class UsersController < ApplicationController
  def new
	@user = User.new
  end

  def create
	@user = User.new(user_params)
	if @user.save
		flash[:notice] = "Sign up succesfully."
		redirect_to root_path 
	else
		flash[:alert] = "Sign up error"
		render :new
	end
  end
  private
  def user_params
	params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end
end
