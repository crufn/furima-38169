class ItemForm
  include ActiveModel::Model

  attr_accessor :item_name, :item_explanation, :price, :category_id, :condition_id, :deliverycharge_id, :image, :region_id, :daysdelivery_id

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

  def save
    return false unless valid?

    item = Item.new(
      item_name: item_name,
      item_explanation: item_explanation,
      price: price,
      category_id: category_id,
      condition_id: condition_id,
      deliverycharge_id: deliverycharge_id,
      image: image,
      region_id: region_id,
      daysdelivery_id: daysdelivery_id,
      user_id: user_id
    )

    item.save
  end
end
