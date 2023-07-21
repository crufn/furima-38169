class Item < ApplicationRecord
  include ActiveHash::Associations
  has_one_attached :images
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :deliverycharge
  belongs_to :region
  belongs_to :daysdelivery
  
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliverycharge_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :daysdelivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, presence: true
  validates :user, presence: true

  has_many :articles
end
