FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_kanji      {Faker::Japanese::Name.last_name}
    last_name_kanji       {Faker::Japanese::Name.first_name}
    first_name_kana       {last_name_kanji.yomi}
    last_name_kana        {first_name_kanji.yomi}
    birth_date            {Faker::Date.birthday}
  end
end