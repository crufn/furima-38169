FactoryBot.define do
  factory :item do
    item_explanation { Faker::Lorem.sentence }
    item_name { Faker::Commerce.product_name }
    price { rand(1000..10000) }
    category_id { Genre.pluck(:id).sample }
    condition_id { Condition.pluck(:id).sample } 
    region_id { Region.pluck(:id).sample } 
    daysdelivery_id { Daysdelivery.pluck(:id).sample } 
    deliverycharge_id { Deliverycharge.pluck(:id).sample } 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
