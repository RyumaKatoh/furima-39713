require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'item_detailが空では登録できない' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it 'category_idがid:1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be black")
      end
      it 'item_condition_idがid:1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be black")
      end
      it 'delivery_burden_idがid:1では登録できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be black")
      end
      it 'prefecture_idがid:1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be black")
      end
      it 'shipping_duration_idがid:1では登録できない' do
        @item.shipping_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration can't be black")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price should be a half-width number")
      end
      it 'priceが299以下だと登録できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be less than 300")
      end
      it 'priceが9999999以上だと登録できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be greater than 9999999")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end    
end
