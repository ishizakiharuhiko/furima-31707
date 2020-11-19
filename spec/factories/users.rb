FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    encrypted_password    {"abc123"}
    password_confirmation {password}
    first_name            {"陽彦"}
    last_name             {"石崎"}
    kana_first_name       {"ハルヒコ"}
    kana_last_name        {"イシザキ"}
    birthday              {"1994-04-04"}
  end
end