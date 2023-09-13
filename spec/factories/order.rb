FactoryBot.define do
  factory :order do
    region_id { Region.where.not(id: 1).sample.id }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    phone_number { Faker::Number.number(digits: 10).to_s }
    token {"tok_abcdefghijk00000000000000000"}
  end
end