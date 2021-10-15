FactoryBot.define do
  factory :item do
    title               { Faker::Lorem.sentence }
    detail              { Faker::Lorem.sentence }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    quality_id          { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    shipment_date_id    { Faker::Number.between(from: 2, to: 4) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_images.png'), filename: 'test_image.png')
    end
  end
end
