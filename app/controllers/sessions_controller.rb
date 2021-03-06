class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are signed in!"
      redirect_to root_url
    else
      flash.now[:alert] = "Invalid username and/or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_url
  end
end
