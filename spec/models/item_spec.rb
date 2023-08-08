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
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'deliverychargeが空だと登録できない' do
        @item.deliverycharge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverycharge can't be blank")
      end
      it 'regionが空だと登録できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'daysdeliveryが空だと登録できない' do
        @item.daysdelivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Daysdelivery can't be blank")
      end
      it 'priceが300円未満では出品ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300円以上または9999999円以下で入力してください")
      end
      it 'priceが9,999,999以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 300円以上または9999999円以下で入力してください")
      end
    end
  end
end