FactoryBot.define do
  factory :order_address do
    post_code     { "001-0905" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    address       { Faker::Address.street_address }
    building      { Faker::Address.secondary_address }
    phone_number  { "08028889900" }
    token         { Faker::Internet.password }
  end
end
