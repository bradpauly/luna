# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a2d3127ff22f5640567eef6f45059e42'
  
  helper_method :admin?, :is_iphone?
  
  protected
  
  def admin?
    if LUNA['require_authentication']
      session[:admin]
    else
      true
    end
  end

  def authenticate( password )
    if password == LUNA['password']
      session[:admin] = true
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_login
    unless admin?
      store_location
      redirect_to login_path 
    end
  end
  
  def determine_layout
    ( iphone_user_agent? || iphone_request? ) ? 'iphone' : 'application'
  end
  
  def is_iphone?
    ( iphone_user_agent? || iphone_request? )
  end
  
  def iphone_request?
    ( request.subdomains.first == 'iphone' || params[ :format ] == 'iphone' )
  end
  
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  
end
