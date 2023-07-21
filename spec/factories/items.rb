FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_explanation {Faker::Lorem.sentence}
    association :user
  end
end
