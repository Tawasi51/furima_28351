FactoryBot.define do
  factory :sale do
    association :item
    association :user
  end
end
