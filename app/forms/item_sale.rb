class ItemSale
  include ActiveModel::Model
  attr_accessor :item_id, :post_code,  :pref_id, :city, :street, :building, :tel, :token, :user_id

  with_options presence: true do
    POST_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    TEL_CODE_REGEX = /\A\d{10,11}\z/
    validates :post_code, format: {with: POST_CODE_REGEX}
    validates :city
    validates :street
    validates :pref_id
    validates :tel, format: {with: TEL_CODE_REGEX}
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    Sale.create(user_id: user_id,item_id: item_id)

    #   住所の情報を保存
    Address.create(post_code: post_code, pref_id: pref_id, city: city, street: street, building: building,tel:tel,
    item_id: item_id)

  end
end
