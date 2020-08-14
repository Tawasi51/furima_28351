FactoryBot.define do
  factory :item do
    name { '鈴' }
    text { '鈴木' }
    category_id { 2 }
    product_state_id { 2 }
    delivery_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { 20_000 }
    association :user
  end
end
