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

  helper_method :search
   def search
     @entries = Entry.search(params[:search])
   end

  helper_method :entry_all

  def entry_all
    @entries = Entry.all
  end

  helper_method :entries_count

  def entries_count
  entries_count = Entry.count
  end

  helper_method :entry_last

  def entry_last
    entry_last = Entry.order("created_at").last
  end

  helper_method :random_items

  def random_items
    offset = rand(1..Entry.count)
    ri = Entry.find_by id: offset
    random_items = ri
  end

  helper_method :random_avatar

  def random_avatar
    offset = rand(1..User.count)
    ra = User.find_by id: offset
    random_avatar = ra
  end

  helper_method :user_all

  def user_all
    @user = User.new
    @users = User.all
  end

  helper_method :single_user

  def single_user
    @user = User.new
  end

  helper_method :comment_all

  def comment_all
    @comment = Comment.new
    @comments = Comment.all
  end
end
