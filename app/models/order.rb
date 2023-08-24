class Order < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :region_id, :city, :address, :building_name, :building_name, :phone_number, :postal_code, :user_id, :item_id

  with_options presence: true do
    validates :region_id, presence: true
    validates :city, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true
    validates :postal_code, presence: true
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: self.item_id, user_id: self.user_id)
    shipping_address = ShippingAddress.create(region_id: self.region_id, city: self.city, address: self.address, phone_number: self.phone_number, postal_code: self.postal_code)
  end

end
