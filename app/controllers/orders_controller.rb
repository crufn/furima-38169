class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @shipping_address = ShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new(address_params)
    if @shipping_address.valid?
       @shipping_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:shipping_address).permit(:region_id, :city, :address, :building_name, :phone_number, :postal_code)
  end
  
end
