class VisitorsController < ApplicationController
  def index
    @entry= Entry.new
    @entries = Entry.where(["date <= ?" , Date.today])
    if params[:search]
      @entries = Entry.search(params[:search]).order('created_at DESC')
    else
      @entries = Entry.all.order('created_at DESC')
    end
  end
    @user= User.new
    @users = User.all
  end
