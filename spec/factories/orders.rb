FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    item  {FactoryBot.build(:item)}
    user  {FactoryBot.build(:user)}
  end
end
