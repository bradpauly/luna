class SiteController < ApplicationController
  
  layout :determine_layout
  
  def index
    @posts = Post.find :all, :order => 'created_at DESC'
  end
  
  def rss
    @posts = Post.find( :all, :limit => 10, :order => 'created_at DESC' )
    @feed_title = "Brad Pauly's Blog"
    @feed_url = "http://" + request.host_with_port + request.request_uri
    @feed_description = "Brad Pauly's Blog"
    response.headers['Content-Type'] = 'application/rss+xml'
    respond_to do | format |
      format.xml { render :layout => false }
    end
  end
  
  def login
    if request.post?
      authenticate( params[:password] )
      if admin?
        redirect_back_or_default('/')
      else
        flash[:notice] = 'Incorrect password, please try again.'
      end
    end
  end
  
  def logout
    session[:admin] = nil
    redirect_to '/' and return
  end
  
end
