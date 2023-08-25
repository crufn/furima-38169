class Order
  include ActiveModel::Model
  attr_accessor :region_id, :city, :address, :building_name, :building_name, :phone_number, :postal_code, :user_id, :item_id

  with_options presence: true do
    validates :region_id
    validates :city
    validates :address
    validates :phone_number
    validates :postal_code
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(region_id: region_id, city: city, address: address, phone_number: phone_number, postal_code: postal_code, building_name: building_name, purchase_record_id: purchase_record.id)
  end
end
