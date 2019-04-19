class ItemController < ApplicationController
  def index 
    @items = Item.where(:order_id => params[:id])
    @order = Order.find(params[:id])
    @allOrders = Orderuser.where("order_id = #{params[:id]}")
    @invited = @allOrders.where("status = 0").count 
    @joined = @allOrders.where("status = 1").count 
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    p params[:id_order].to_i
    @item = Item.new(item_params.merge({:order_id=>params[:id_order].to_i, :user_id=>params[:user_id].to_i}))
    if @item.save   
      flash[:notice] = 'Product added!'  
      redirect_to :action => 'index' , :id => params[:id_order].to_i
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
    p params[:id].to_i
    
    p params[:id_order].to_i


    @removed_item = Item.find(params[:id])
    p "he"
    p params
    @removed_item.destroy
    redirect_to :action => 'index' , :id => params[:id_order].to_i
    
  end

  def item_params   
    params.require(:item).permit(:item_name, :amount, :price, :comment, :order_id, :user_id)   
  end   

  def listInvited
    @invited = Orderuser.where("order_id = #{params[:order_id]} AND status = 0")
  end

  def listJoined
    @joined = Orderuser.where("order_id = #{params[:order_id]} AND status = 1")
  end

  def deleteInvited
    @order_id = params[:order_id]
    @user = Orderuser.where("order_id = #{params[:order_id]} AND user_id = #{params[:user_id]}")
    p "*****************************************"
    p @user
    p "*****************************************"
    @user.delete(@user.ids[0])
    redirect_to "/item/listInvited?order_id=#{@order_id}"
  end

end 
