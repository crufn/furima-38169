class ProtoController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @proto = Proto.all
  end

  def new
    @item = Item.new
  end

  def create
    @proto = Proto.create(proto_params)
    if @proto.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def proto_params
    params.require(:proto).permit(:nickname, :email, :family_name, :first_name, :family_kata, :first_kata, :birthday, :image)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
