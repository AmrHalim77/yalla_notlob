class ItemController < ApplicationController
  def index 
    @items = Item.all
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    p params[:id_order].to_i
    @item = Item.new(item_params.merge({:order_id=>params[:id_order].to_i}))
    if @item.save   
      flash[:notice] = 'Product added!'  
      redirect_to @item
    else   
        flash[:error] = 'Failed to edit product!'   
        # render :new   
  end     

    #render plain: params[:item].inspect

    # @item = Item.new(item_params)   
    # if @item.save   
    #   flash[:notice] = 'Product added!'   
    #   redirect_to root_path   
    # else   
    #   flash[:error] = 'Failed to edit product!'   
    #   render :new   
    # end   
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def item_params   
    params.require(:item).permit(:item_name, :amount, :price, :comment, :order_id)   
  end   

end
