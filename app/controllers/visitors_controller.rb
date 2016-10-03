class VisitorsController < ApplicationController
  def index
    @entry= Entry.new
    @entries = Entry.where(["date <= ?" , Date.today])
    if params[:search]
      @entries = Entry.search(params[:search]).order('created_at DESC')
    else
      @entries = Entry.all.paginate(:page => params[:page], :per_page => 10)
    end
  end
    @user= User.new
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all
  end
