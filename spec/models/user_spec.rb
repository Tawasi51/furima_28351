require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録の保存' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは@を含む必要があること' do
      @user.password = 'abc12abseekkk.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width English numbers and letters.')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上であること' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは半角英数字混合であること' do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input half-width English numbers and letters.')
    end
    it 'family_nameが必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'given_nameが必須であること' do
      @user.given_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name can't be blank")
    end
    it 'kana_family_nameが必須であること' do
      @user.kana_family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end
    it 'kana_give_nameが必須であること' do
      @user.kana_given_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana given name can't be blank")
    end
    it 'family_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.family_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
    end
    it 'give_nameは全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.given_name = 'takesi'
      @user.valid?
      expect(@user.errors.full_messages).to include('Given name is invalid. Input full-width characters.')
    end
    it 'kana_family_nameは全角（カタカナ）で入力させること' do
      @user.kana_family_name = '斎藤'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width katakana characters.')
    end
    it 'kana_family_nameは全角（カタカナ）で入力させること' do
      @user.kana_given_name = 'ひろこ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana given name is invalid. Input full-width katakana characters.')
    end
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
