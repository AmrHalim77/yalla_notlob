class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @notifications = current_user.notifications
  end

  def friend
    
  end

  def addfriend
    p params[:user][:friend]
    @user = User.find_by(:email=>params[:user][:friend])
    p @user

  end


  def notifications_list

    @notifications = current_user.notifications
    @users = User.all
    redirect_to "/users/#{current_user.id}/notifications"  
  end

  def notifications_center

    @notifications = current_user.notifications
    @users = User.all
    redirect_to "/users/#{current_user.id}/notifications"  
  end

  def login
  end




end
