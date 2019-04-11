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
      flash[:notice] = 'order added!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit product!'   
      # render :new   
    end   
    render plain: params[:item].inspect
  end

  def edit
  end

  def update
  end

  def destroy
    @order = Order.find(params[:id])   
    if @order.delete   
      flash[:notice] = 'Product deleted!'   
      # redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
  end

end


def order_params   
  params.require(:product).permit(:name, :price, :old_price, :short_description, :full_description)   
end   
