require 'rails_helper'

RSpec.describe Sale, type: :model do
  before do
    @sale = FactoryBot.build(:sale)
  end
  describe '商品情報の保存' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@sale).to be_valid
    end
    it 'user_idが空だと保存できない' do
      @sale.user = nil
      @sale.valid?
      expect(@sale.errors.full_messages).to include('User must exist')
    end
    it 'item_idが空だと保存できない' do
      @sale.item = nil
      @sale.valid?
      expect(@sale.errors.full_messages).to include('Item must exist')
    end
  end
end
