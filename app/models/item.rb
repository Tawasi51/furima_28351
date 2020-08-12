class Item < ApplicationRecord
   belongs_to :user
   has_one :sale
   has_one :address
   has_one_attached :image

   with_options validates presence: true do
      validates :name
      validates :text
      validates :category
      validates :product_state
      validates :delivery
      validates :prefecture
      validates :days
      validates :price
   end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
