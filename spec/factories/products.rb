FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    until_delivery_id { 2 }
    price { Faker::Number.number(digits: 4)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
