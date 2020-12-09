FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_number    { '123-4567' }
    prefecture_id    { 2 }
    city             { '熊本市' }
    street           { '中央区' }
    building_name    { 'でかいビル' }
    telephone_number { '08012345678' }
    item_id          { 2 }
  end
end
