class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/' unless current_user
  end

  def time_limit
    if @challenge.proof_description == "Week"
      (Date.today - @student.cohort.end_date) > 0
    end
  end

end
