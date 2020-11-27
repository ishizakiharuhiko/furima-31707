FactoryBot.define do
  factory :item do
    title            { 'コート' }
    text             { 'コートです' }
    category_id      { '2' }
    status_id        { '2' }
    shipping_id      { '2' }
    prefecture_id    { '2' }
    day_id           { '2' }
    price            { '114514' }
    user
  end
end
