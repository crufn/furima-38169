FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name           { "田中" }
    family_kata           { "タナカ" }
    first_name            { "太郎" }
    first_kata            { "タロウ" }
    birthday              { Date.today }
  end
end