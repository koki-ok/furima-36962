FactoryBot.define do
  factory :user do
    nickname            { Faker::Name.initials(number: 4) }
    email               { Faker::Internet.free_email }
    password            { '1a' + Faker::Internet.password(min_length: 6) }
    encrypted_password  { password }

    japanese_user = Gimei.name

    last_name           { japanese_user.last.kanji }
    first_name          { japanese_user.first.kanji }
    last_name_kana      { japanese_user.last.katakana }
    first_name_kana     { japanese_user.first.katakana }
    birth_day           { '2020-01-01' }
  end
end
