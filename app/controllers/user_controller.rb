class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @friends = Friendship.where(:user_id => current_user.id)
    @friendsids = []
    @friends.each do |idd|
    @friendsids.push(idd.friend_id)
    end
    @orders = Order.where(:user_id => current_user.id)
  end

  def friend
    
  end

  def addfriend
    p params[:user][:friend]
    @user = User.find_by(:email=>params[:user][:friend])
    p @user

  end


  def notifications_list

    @notifications = current_user.notifications.unopened_only
    @users = User.all
    redirect_to "/users/#{current_user.id}/notifications"  
  end

  def login
  end




end
