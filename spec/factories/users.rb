FactoryBot.define do
  factory :user do
    nickname { "abc" }
    email     {"susususu111@suzu.jp"}
    family_name { "鈴木" }
    password { "00000000aaaa" }
    password_confirmation { password }
    given_name { "定夫" }
    kana_family_name { "スズキ"}
    kana_given_name {"サダオ"}
    birth_day {"1990-12-12"}
  end
end
