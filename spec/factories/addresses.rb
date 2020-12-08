FactoryBot.define do
  factory :address do
    postal_number    { '123-4567' }
    prefecture_id    { 2 }
    city             { '熊本市' }
    street           { '中央区' }
    building_name    { 'でかいビル' }
    telephone_number { '08012345678' }
    order            { FactoryBot.build(:order) }
  end
end
