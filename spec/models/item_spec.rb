require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '登録できるとき' do
      it 'imageとcategory、conditionとdaysdelivery、deliverychargeとregion、item_explanationとitem_nameがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '登録できないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_explanationが空だと登録できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'conditionが空だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'deliverychargeが空だと登録できない' do
        @item.deliverycharge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycharge must be other than 1")
      end
      it 'regionが空だと登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      it 'daysdeliveryが空だと登録できない' do
        @item.daysdelivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Daysdelivery must be other than 1")
      end
      it 'priceが300円未満では出品ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字、又は300円以上または9999999円以下で入力してください")
      end
      it 'priceが9,999,999以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字、又は300円以上または9999999円以下で入力してください")
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字、又は300円以上または9999999円以下で入力してください")
      end
      it 'ユーザー情報がない場合は登録ができない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end