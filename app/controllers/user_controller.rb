class UserController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def friend
    
  end

  def addfriend
    p params[:user][:friend]
    @user = User.find_by(:email=>params[:user][:friend])
    p @user

  end

  def login
  end




end
