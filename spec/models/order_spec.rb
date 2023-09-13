require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入' do
    context 'できるとき' do
      it 'すべての情報が正しく入力されていれば登録ができる' do
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
    end
  end
end