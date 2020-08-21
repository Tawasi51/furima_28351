FactoryBot.define do
  factory :item_sale do
    post_code {'111-3333'}    
    pref_id   { 4 } 
    city    { '京都府棚橋' }
    street    { '国田4−3−３' }
    building  { 'メゾンド卑弥呼' }
    tel    { '0606667767' }
  end
end
