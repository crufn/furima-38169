require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '登録できるとき' do
      it 'imageとgenre、conditionとdaysdelivery、deliverychargeとregion、item_explanationとitem_nameがあれば登録できる'
        expect(@item).to be_valid
      end
    end
  context '登録できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
      end
      it 'item_explanationが空だと登録できない' do
      end
      it 'genreが空だと登録できない' do
      end
      it 'conditionが空だと登録できない' do
      end
      it 'deliverychargeが空だと登録できない' do
      end
      it 'regionが空だと登録できない' do
      end
      it 'daysdeliveryが空だと登録できない' do
      end
    end
  end

