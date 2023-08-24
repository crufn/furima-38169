class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @user = User.find(current_user.id)
    if @order.valid?
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end
 
  private

  def order_params
    params.require(:order).permit(:region_id, :city, :address, :building_name, :phone_number, :postal_code)
  end
  
end
