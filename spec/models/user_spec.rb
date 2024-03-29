require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '正常' do
    it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfamily_kata、first_nameとfirst_kata、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '異常' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_kataが空では保存できない' do
      @user.family_kata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kata can't be blank")
    end
    it 'first_nameが空では保存できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_kataが空では保存できない' do
      @user.first_kata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kata can't be blank")
    end
    it 'birthdayが空では保存できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'password'
      @user.password_confirmation = 'different_password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')    
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordは5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは、半角英数字での入力が必須' do
      @user.password = 'パスワード'
      @user.password_confirmation = 'パスワード'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it '名前はカタカナでの入力が必須であること' do       
      @user.family_kata = 'ひらがな'
      @user.first_kata = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kata is invalid", "First kata is invalid")
    end
    
    it '英字のみのパスワードでは設定できない' do
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it '数字のみのパスワードでは設定できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.family_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.family_kata = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family kata is invalid")
    end
  end
end

end
