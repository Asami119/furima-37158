require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入（保存）機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    end

    context '商品購入（保存）できるとき' do
      it '値がすべて存在すれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end

      it 'address_buildingが空でも保存できる' do
        @purchase_shipping.address_building = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品購入（保存）できないとき' do
      it 'postcodeが空では保存できない' do
        @purchase_shipping.postcode = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postcode can't be blank") 
      end

      it 'postcodeがハイフン無しでは保存できない' do
        @purchase_shipping.postcode = 1234567
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)") 
      end

      it 'prefecture_idが未選択（デフォルト(1)のまま）では保存できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank") 
      end
      
      it 'address_cityが空では保存できない' do
        @purchase_shipping.address_city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address city can't be blank") 
      end

      it 'address_blockが空では保存できない' do
        @purchase_shipping.address_block = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address block can't be blank") 
      end

      it 'phone_numberが空では保存できない' do
        @purchase_shipping.phone_number = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank") 
      end

      it 'phone_numberが9桁以下では保存できない' do
        @purchase_shipping.phone_number = 123456789
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number は、10桁以上11桁以内の半角数値のみ入力可能です") 
      end

      it 'phone_numberが12桁以上では保存できない' do
        @purchase_shipping.phone_number = 123456789012
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number は、10桁以上11桁以内の半角数値のみ入力可能です") 
      end

      it 'phone_numberにハイフンが含まれていては保存できない' do
        @purchase_shipping.phone_number = '123-1234-1234'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number は、10桁以上11桁以内の半角数値のみ入力可能です") 
      end

      it 'phone_numberが全角数字では保存できない' do
        @purchase_shipping.phone_number = '１２３４５６７８９０'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number は、10桁以上11桁以内の半角数値のみ入力可能です") 
      end

      it '購入者（user_id）が紐付いていなければ保存できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank") 
      end

      it '購入商品（item_id）が紐付いていなければ保存できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank") 
      end
    end
  end
end
