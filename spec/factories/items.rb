FactoryBot.define do
  factory :item do
    item_explanation { Faker::Lorem.sentence }
    item_name { Faker::Commerce.product_name }
    price { rand(1000..10000) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Condition.pluck(:id).reject { |id| id == 1 }.sample }
    region_id { Region.pluck(:id).reject { |id| id == 1 }.sample }
    daysdelivery_id { Daysdelivery.pluck(:id).reject { |id| id == 1 }.sample }
    deliverycharge_id { Deliverycharge.pluck(:id).reject { |id| id == 1 }.sample }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
