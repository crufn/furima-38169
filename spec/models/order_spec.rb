require 'rails_helper'

RSpec.describe Order, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context 'できるとき' do
      it 'すべての情報が正しく入力されていれば登録ができる' do
        expect(@order).to be_valid
      end
      it '建物名が空でも登録できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context 'できないとき' do
      it 'region_idが空だと登録できない' do
        @order.region_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Region must be other than 1")
      end
      it 'cityが空だと登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'tokenが空では保存出来ない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.phone_number = '123456789000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order.phone_number = 'abc123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
      expect(@order.errors.full_messages).to include("Postal code は「3桁ハイフン4桁」の形式で入力してください")
      end
      it 'userが紐づいてなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいてなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end