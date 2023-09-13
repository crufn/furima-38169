class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])

    if current_user == @item.user
      redirect_to root_path
    elsif @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @user = current_user.id

    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render :index
    end

  end
  
  private

  def order_params
    params.require(:order).permit(:region_id, :city, :address, :building_name, :phone_number, :postal_code).merge(item_id: @item.id, user_id: current_user.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      item_price = @item.price
      Payjp::Charge.create(
        amount: item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
  
end

