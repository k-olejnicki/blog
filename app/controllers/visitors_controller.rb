class VisitorsController < ApplicationController
  def index
    @entry= Entry.new
    @entries = Entry.where(["date <= ?" , Date.today])
    @user= User.new
    @users = User.all
  end
end
