class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :daysdelivery
  belongs_to_active_hash :region
  belongs_to :user
  
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true,
                       message: "半角数字、又は300円以上または9999999円以下で入力してください"
                       }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :deliverycharge_id, presence: true, numericality: { other_than: 1 }
  validates :daysdelivery_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence:true

end
