class OrderController < ApplicationController
  def ind
    redirect_to items_index_path
  end
  
  def index
    @orders = Order.where(:user_id => current_user.id)
    p @orders
    @user_orders = Orderuser.where("user_id = #{current_user.id} AND status = 1")
    @joined_orders = []
    @user_orders.each do |order|
      @joined_orders << Order.find(order.order_id)
    end
  end

  def toitem
    @order = Order.find(params[:id])
    redirect_to :controller => 'item' , :action => 'index' , :id => params[:id]
  end

  def display_notification
    @order = Order.find(params[:format])
    @order_users=Orderuser.where(order_id: params[:format], user_id: current_user.id) 
    @order_users.first.status =1
    @order_users.first.save

    redirect_to :controller => 'item' , :action => 'index' , :id => params[:format]
  end

  def show   
    @order = Order.find(params[:id])   
  end   

  def new

  end

  def create

    @order = Order.new(order_params.merge({:user=>current_user , :order_status=>"waiting"}))   
    
    
    if @order.save   
      # flash[:notice] = 'Order added!' 
      redirect_to "/order/listall?order_id=#{@order.id}"
      # redirect_to action: "index"
    else   
      flash[:error] = 'Failed to edit Order!'   
      redirect_to "/order/index" 
    end   

    # render plain: params[:order].inspect
  end

  # GET method for editing a Order based on id
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attribute(:order_status, "finished" )
      p  @order
      @order.notify :users, key: "finished an order from" , parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email } 
      flash[:notice]="Order is finished!"
      redirect_to action: "index"

    else
      flash[:error]= "couldn't finish order!"
      redirect_to action: "index"
    end
  end



  def destroy
    @order = Order.find(params[:id])
    @ordusers=Orderuser.where(order_id: params[:id])    

    @ordusers.each do |unit|
      @order.invited_users= unit.user_id.to_s
      @order.notify :users, key: "cancelled an order from" , parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email } 
      unit.destroy
    end
    # @ordusers.destroy_all 
    if @order.delete
      flash[:notice] = "order cancelled!"
      redirect_to action: "index"
    else
      flash[:error] = "couldn't cancel order!"
      redirect_to action: "index"
    end
  end



  def listall
    @order_id = params[:order_id]
    @groups = Group.where("user_id = #{current_user.id}")
    @friends = Friendship.where("user_id = #{current_user.id}")
  end

  def addfriend
    @order_id = params[:order_id]
    @order= Order.find(params[:order_id])
    p @order
    @user_id = params[:user_id]
    @order_user = Orderuser.new({:order_id => @order_id, :user_id => @user_id, :status => 0})
    
    if @order_user.save
      @order.invited_users=@user_id.to_s
      @order.notify :users, key: "invited you to order from" , parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email }
    end 
    # redirect_to action: "listall"
    redirect_to "/order/listall?order_id=#{@order_id}"

  end



  def addgroup
    @group_id = params[:group_id]
    @order_id = params[:order_id]
    @groupmembers = Groupmember.where("group_id = #{@group_id}")
    @order= Order.find(params[:order_id])
    @groupmembers.each do |member|
      @order_user = Orderuser.new({:order_id => @order_id, :user_id => member.user_id, :status => 0})
      if @order_user.save
        @order.invited_users=@order_user.user_id.to_s
        @order.notify :users, key: "invited you to order from" , parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email } 
      end
    end
    redirect_to "/order/listall?order_id=#{@order_id}"
  end


  def order_params   
    params.require(:order).permit( :order_type, :restaurant, :invited_users, :menu)   
    end 
end
