FactoryBot.define do
  factory :order_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { '123-4567' }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    city_town        { Gimei.city.kanji }
    address_number   { Gimei.town.kanji }
    building         { '建物名' }
    phone_number     { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    association :item
    association :user
  end
end
