class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  class Forbidden < StandardError; end
  private 
  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end 

  def login_required
  	raise Forbidden unless current_user
  end 

  helper_method :current_user
end
