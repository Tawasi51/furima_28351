require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品情報の保存' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが存在していれば保存できること' do
      @item.image = nil
      expect(@item).to be_valid
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空だと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @item.product_state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Product state can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが3000円未満では保存できないこと' do
      @item.price =  0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it 'user_idが空だと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
