class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @invited_challenges = Challenge.where({challenger_email: @user.email})
      if !@invited_challenges.empty?
        @invited_challenges.each do | challenge |
        challenge.challenger_id = session[:user_id]
        challenge.save
      end
    end
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @received_challenges = @user.received_challenges
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :show
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :last_name, :phone_number, :location, :username, :password, :password_confirmation, :gender, :birth_date, :img_url)
  end
end


