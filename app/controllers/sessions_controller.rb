class SessionsController < ApplicationController
  def create 
    @user = User.authenticate(params[:user_name], params[:password])
    if @user 
      flash[:notice] = "You've signed in."
      session[:user_id] = "You've signed in!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end
end