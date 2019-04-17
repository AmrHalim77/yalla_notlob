class OrderController < ApplicationController
  def ind
    redirect_to items_index_path
  end
  
  def index
  @orders = Order.where(:user_id => current_user.id)
  end

  def toitem
    @order = Order.find(params[:id])
    redirect_to :controller => 'item' , :action => 'index' , :id => params[:id]
  end

  def display_notification
    @order = Order.find(params[:format])
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
      @order.notify :users, key: "created an order", parameters: { :text => "hello",:restaurant => order_params["restaurant"] , :owner => current_user.email }
      redirect_to action: "index"
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
      @order.notify :users, key: "finished an order", parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email } 
      flash[:notice]="Order is finished!"
      redirect_to action: "index"

    else
      flash[:error]= "couldn't finish order!"
      redirect_to action: "index"
    end
  end

  def destroy

    @order = Order.find(params[:id])
    if @order.delete
      @order.notify :users, key: "cancelled an order", parameters: { :text => "hello",:restaurant => @order[:restaurant] , :owner => current_user.email } 
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
    @user_id = params[:user_id]
    @order_user = Orderuser.new({:order_id => @order_id, :user_id => @user_id, :status => 0})
    @order_user.save
    # redirect_to action: "listall"
    redirect_to "/order/listall?order_id=#{@order_id}"

  end

  def addgroup
    @group_id = params[:group_id]
    @order_id = params[:order_id]
    @groupmembers = Groupmember.where("group_id = #{@group_id}")
    p "****************************************"
    p @groupmembers.length
    p @group_id
    p "****************************************"
    @groupmembers.each do |member|
      @order_user = Orderuser.new({:order_id => @order_id, :user_id => member.user_id, :status => 0})
      @order_user.save
    end
    redirect_to "/order/listall?order_id=#{@order_id}"
  end


  def order_params   
    params.require(:order).permit( :order_type, :restaurant, :invited_users, :menu)   
    end 
end
