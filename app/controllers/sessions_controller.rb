class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user
    else
      user = User.find_by({email: params[:email]})
      session[:user_id] = user.id
      redirect_to user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
