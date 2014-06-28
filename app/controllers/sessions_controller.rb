class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.where(:email => params[:login][:email]).first
	
	if user && user.authenticate(params[:login][:password])
		session[:user_id] = user.id
		flash[:notice] = "Signed in successfully."
	else
		flash[:error] = "Error signing in."
		render :new
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to root_path
  end
end
