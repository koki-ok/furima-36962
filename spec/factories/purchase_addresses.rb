FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    building_name { 'ビル101' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
