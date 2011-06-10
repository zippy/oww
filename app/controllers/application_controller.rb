class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  helper_method :current_shop
  
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    sign_out_thanks_path
  end
  
  def current_shop
    Shop.find(:first)
  end
end
