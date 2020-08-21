require 'rails_helper'

RSpec.describe ItemSale, type: :model do
  describe 'ユーザーの配送先情報' do
    before do
      @item_sale = FactoryBot.build(:item_sale)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_sale).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @item_sale.post_code = nil
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Post code is invalid")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @item_sale.post_code = '1234567'
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Post code is invalid")
    end
    it 'cityが空だと保存できないこと' do
      @item_sale.city = nil
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("City can't be blank")
    end
    it 'streetが空だと保存できないこと' do
      @item_sale.street = nil
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Street can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @item_sale.building = nil
      expect(@item_sale).to be_valid
    end
    it 'telが空だと保存できないこと' do
      @item_sale.tel = nil
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Tel is invalid")
    end
    it 'telが全角数字だと保存できないこと' do
      @item_sale.tel = '２０００'
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Tel is invalid")
    end
    it 'telにハイフンは不要' do
      @item_sale.tel = '123-456-7888'
      @item_sale.valid?
      expect(@item_sale.errors.full_messages).to include("Tel is invalid")
    end
  end
end
