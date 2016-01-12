class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  helper_method :entry_all

  def entry_all
    @entry= Entry.new
    @entries = Entry.all
  end

  helper_method :user_all

  def user_all
    @user = User.new
    @users = User.all
  end

  helper_method :comment_all

  def comment_all
    @comment = Comment.new
    @comments = Comment.all
  end
end
