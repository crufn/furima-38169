class Item < ApplicationRecord

  has_many_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :deliverycharge
  belongs_to :user
  
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_explanation, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                    format: { with: /\A[0-9]+\z/, message: "半角数字のみ入力してください" }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :deliverycharge_id, presence: true, numericality: { other_than: 1 }
  validates :daysdelivery_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence:true

end
