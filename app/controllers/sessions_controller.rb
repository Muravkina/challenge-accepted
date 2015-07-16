class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      @invited_challenges = Challenge.where({challenger_email: request.env["omniauth.auth"].info.email})
    else
      user = User.find_by({email: params[:email]})
      session[:user_id] = user.id
      @invited_challenges = Challenge.where({challenger_email: params[:email]})
    end
    if !@invited_challenges.empty?
      @invited_challenges.each do | challenge |
        challenge.challenger_id = session[:user_id]
        challenge.save
      end
    end
    redirect_to user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
