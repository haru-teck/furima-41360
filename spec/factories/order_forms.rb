FactoryBot.define do
  factory :order_form do
    post { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09012345678' }
    token { Faker::Internet.uuid }
  end
end
