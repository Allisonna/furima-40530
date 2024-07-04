require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品登録できる場合' do
      it 'user_id, image, title, content, category_id, status_id, shipping_cost_id, shipping_area_id, shipping_day_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない場合' do
      it 'ユーザーが存在しないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担が空では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域が空では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数が空では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間でなければなりません')
      end

      it '価格は¥300以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間でなければなりません')
      end

      it '価格は¥9,999,999以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間でなければなりません')
      end

      it '価格は半角数値でないと登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は¥300〜¥9,999,999の間でなければなりません')
      end
    end
  end
end
