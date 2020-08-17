class Item < ApplicationRecord
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :user
   has_one :sale
   has_one :address
   has_one_attached :image

   belongs_to_active_hash :category
   belongs_to_active_hash :product_state
   belongs_to_active_hash :delivery
   belongs_to_active_hash :prefecture
   belongs_to_active_hash :day


   with_options presence: true do
      validates :name
      validates :text
      validates :prefecture
      validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range"}
   end

   with_options numericality: { greater_than: 1, message: "is out of setting range"} do
    validates :category_id
    validates :product_state_id
    validates :delivery_id
    validates :day_id
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #          :recoverable, :rememberable, :validate
end
