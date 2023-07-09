class ProtoController < ApplicationController
  def index
    @proto = Proto.all
  end

  def new
    @proto = Proto.new
  end

  def create
    Proto.create(proto_params)
  end

  private
  def proto_params
    params.require(:proto).permit(:nickname, :email, :family_name, :first_name, :family_kata, :first_kata, :birthday)
  end
  
end
