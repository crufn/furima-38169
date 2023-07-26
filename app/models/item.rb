class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :genre
  belongs_to :condition
  belongs_to :deliverycharge
  belongs_to :region
  belongs_to :daysdelivery
  belongs_to :user
  
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
    validates :deliverycharge_id, presence: true, numericality: { other_than: 1 }
  validates :daysdelivery_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true

end
