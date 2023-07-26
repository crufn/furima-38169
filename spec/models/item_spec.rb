require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '登録できるとき' do
      it 'imageとgenre、conditionとdaysdelivery、deliverychargeとregion、item_explanationとitem_nameがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '登録できないとき' do
      it 'imageが空だと登録できない' do
        @item = FactoryBot.build(:item, image: '')
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Item_name can't be blank")
      end
      it 'item_explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Item_explanation can't be blank")
      end
      it 'genreが空だと登録できない' do
        @item.genre = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Genre can't be blank")
      end
      it 'conditionが空だと登録できない' do
        @item.condition = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Condition can't be blank")
      end
      it 'deliverychargeが空だと登録できない' do
        @item.deliverycharge = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Deliverycharge can't be blank")
      end
      it 'regionが空だと登録できない' do
        @item.region = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Region can't be blank")
      end
      it 'daysdeliveryが空だと登録できない' do
        @item.daysdelivery = ''
        @item.valid?
        expect(@item.errors.fullmessages).to include("Daysdelivery can't be blank")
      end
    end
  end
end