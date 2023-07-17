class Item < ApplicationRecord
  validates :item_name, presences: true
  validates :item_explanation, presences: true
  validates :price, presences: true
  validates :category_id, presences: true
  validates :deliverycharge_id, presences: true
  validates :daysdelivery_id, presences: true
  validates :region_id, presences: true
  validates :user, presences: true
end
