class Order < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :region_id, :city, :address, :building_name, :building_name, :phone_number, :postal_code
  
  belongs_to :user
  belongs_to :item
  belongs_to :shipping_address

  with_options presence: true do
    validates :region_id, presence: true
    validates :city, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true
    validates :postal_code, presence: true
  end

  def save
    purchase_record = Purchase_record.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(region_id: region_id, city: city, address: address, phone_number: phone_number, postal_code: postal_code)
  end

end
