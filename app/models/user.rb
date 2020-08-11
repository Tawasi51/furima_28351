class User < ApplicationRecord
  has_many :sales
  has_many :items

   with_options presence: true do
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]*\z/
    validates :nickname
    validates :family_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :given_name, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :kana_family_name, format: { with: VALID_KANA_NAME_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :kana_given_name, format: { with: VALID_KANA_NAME_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Input half-width English numbers and letters.' }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   end




