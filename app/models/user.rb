class User < ApplicationRecord
  has_many :sales
  has_many :items

  # with_options presence: true do
    validates :nickname, presence: {message: "is invalid. Input required nickname."}
    # validates :password, format: { with: presence: true, message: "is invalid. Input required password."}
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]\Z/, message: "is invalid. Input half-width English numbers and letters."}
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
   end




