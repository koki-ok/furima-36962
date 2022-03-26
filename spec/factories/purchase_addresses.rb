FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    telephone_number { '09012345678' }
  end
end
