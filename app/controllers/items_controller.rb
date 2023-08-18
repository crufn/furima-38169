class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    @user = @item.user
    @is_same_user = current_user == @user
    @is_own_item = @user == current_user
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
    end
      redirect_to root_path
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :new
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :price, :category_id, :condition_id, :deliverycharge_id, :image, :region_id, :daysdelivery_id).merge(user_id: current_user.id)
  end
end
