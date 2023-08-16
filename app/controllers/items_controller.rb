class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @is_same_user = current_user == @user
    @is_own_item = @user == current_user
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :price, :category_id, :condition_id, :deliverycharge_id, :image, :region_id, :daysdelivery_id).merge(user_id: current_user.id)
  end
end
