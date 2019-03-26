class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate_user!
    return true
  end
end