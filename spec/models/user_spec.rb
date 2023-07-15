require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '異常なデータの場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      expect(@user).not_to be_valid
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      expect(@user).not_to be_valid
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      expect(@user).not_to be_valid
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      expect(@user).not_to be_valid
    end
    it 'family_kataが空では保存できない' do
      @user.family_kata = ''
      expect(@user).not_to be_valid
    end
    it 'first_nameが空では保存できない' do
      @user.first_name = ''
      expect(@user).not_to be_valid
    end
    it 'first_kataが空では保存できない' do
      @user.first_kata = ''
      expect(@user).not_to be_valid
    end
    it 'birthdayが空では保存できない' do
      @user.birthday = nil
      expect(@user).not_to be_valid
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'password'
      @user.password_confirmation = 'different_password'
      expect(@user).not_to be_valid
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'invalid_email'
      expect(@user).not_to be_valid
    end
    it 'passwordは6文字以上の入力が必須' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      expect(@user).not_to be_valid
     end
     it 'passwordは、半角英数字での入力が必須' do
      @user.password = 'パスワード'
      @user.password_confirmation = 'パスワード'
      expect(@user).not_to be_valid
     end
      it '名前はカタカナでの入力が必須であること' do        @user.family_kata = 'ひらがな'
      @user.first_kata = 'ひらがな'
      expect(@user).not_to be_valid
    end
  end
end

end
