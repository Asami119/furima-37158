require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品（保存）機能' do
    context '商品出品（保存）できるとき' do
      it '値がすべて存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品（保存）できないとき' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'categoryが未選択（デフォルト(1)のまま）では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが未選択（デフォルト(1)のまま）では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'postageが未選択（デフォルト(1)のまま）では保存できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'prefectureが未選択（デフォルト(1)のまま）では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'days_postが未選択（デフォルト(1)のまま）では保存できない' do
        @item.days_post_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days post can't be blank")
      end

      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字では保存できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数値のみ設定可能です')
      end

      it 'priceに記号が含まれていては保存できない' do
        @item.price = '10,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数値のみ設定可能です')
      end

      it 'priceは¥300以上でなければ保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は、¥300~¥9,999,999の間で設定してください')
      end

      it 'priceは¥9,999,999以下でなければ保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は、¥300~¥9,999,999の間で設定してください')
      end

      it 'user（出品者）が紐付いていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
