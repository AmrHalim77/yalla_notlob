class OrderController < ApplicationController
  def index
  @orders = Order.all
  end

  def show   
    @order = Order.find(params[:id])   
  end   

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params.merge({:user=>current_user}))   
    if @order.save   
      flash[:notice] = 'Order added!'  
    else   
        flash[:error] = 'Failed to edit order!'   
        # render :new   
  end  

  def edit
  end

  def update
  end

  def destroy
  end
end
