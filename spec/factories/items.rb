FactoryBot.define do
  factory :item do
    name                 {Faker::Commerce.product_name}
    item_detail          {Faker::Lorem.paragraph}
    category_id          {Faker::Number.between(from:2,to:11)}  # 1から5までのランダムな整数
    item_condition_id    {Faker::Number.between(from:2,to:7)}  # 1から3までのランダムな整数
    delivery_burden_id   {Faker::Number.between(from:2,to:3)}  # 1から2までのランダムな整数
    prefecture_id        {Faker::Number.between(from:2,to:48)}  # 1から47までのランダムな整数
    shipping_duration_id {Faker::Number.between(from:2,to:4)}  # 1から3までのランダムな整数
    price                {Faker::Number.between(from:300,to:9_999_999)}  # 300から999999までのランダムな整数
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end

end
