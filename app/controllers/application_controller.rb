# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private

  def admin?
    session[:admin]
  end
  helper_method :admin?

  def authorize
    unless admin?
      flash[:error] = "Not authorized to access this page."
      redirect_to root_url
    end
  end
end
