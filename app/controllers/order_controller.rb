class OrderController < ApplicationController
  def ind
    redirect_to items_index_path
  end
  
  def index
  @orders = Order.all
  end

  def toitem
    @order = Order.find(params[:id])
    redirect_to :controller => 'item' , :action => 'index' , :id => params[:id]
  end

  def show   
    @order = Order.find(params[:id])   
  end   

  def new
    @order = Order.new
  end

  def create

    @order = Order.new(order_params.merge({:user=>current_user , :order_status=>"waiting"}))   
    if @order.save   
      # flash[:notice] = 'Order added!' 
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
      flash[:notice] = "order cancelled!"
      redirect_to action: "index"
    else
      flash[:error] = "couldn't cancel order!"
      redirect_to action: "index"
    end
  end


  def order_params   
    params.require(:order).permit( :order_type, :restaurant, :invited_users, :)   
    end 
end
