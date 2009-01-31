class CommentsController < ApplicationController
  
  layout :determine_layout
  before_filter :require_login, :except => [ :create ]
  
  def index
    @comments = Comment.find(:all)
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if params[:comment][:occupation] && params[:comment][:occupation] == '' && @comment.save
        format.js do
          @post = @comment.post
          render :update do | page |
            page.insert_html :bottom, 'comments', :partial => 'posts/comment', :locals => { :comment => @comment }            
            @comment = Comment.new
            page.replace_html 'comment_form', :partial => 'comments/form'
            page << "$('comment_form').hide();"            
          end
        end
      else
        format.js do
          @post = @comment.post
          render :update do | page |
            page.replace_html 'comment_form', :partial => 'comments/form'
          end
        end
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.remove "comment_#{@comment.id}"
        end
      end
    end
  end
end
