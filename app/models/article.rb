class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash ::category_id,:product_state,:delivery,:prefecture,:days


  validates :name,:text,:category,:product_state,:delivery,:prefecture,:days,:price, :image true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:product_state_id,:delivery_id,:prefecture_id,:days_id, numericality: { other_than: 1 } 
end
