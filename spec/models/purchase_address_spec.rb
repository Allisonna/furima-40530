require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id,
                                                            token: 'tok_abcdefghijk00000000000000000', shipping_area_id: 2)
  end
  describe '購入者情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'address2は空でも保存できること' do
        @purchase_address.address2 = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと保存できないこと' do
        @purchase_address.address1 = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telに半角のハイフンが含まれていると保存できないこと' do
        @purchase_address.tel = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel は10または11桁の数字のみ入力してください')
      end
      it 'telが9桁の場合保存できない' do
        @purchase_address.tel = '090-1234-56'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel は10または11桁の数字のみ入力してください')
      end
      it 'telが12桁の場合保存できない' do
        @purchase_address.tel = '090-1234-56789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel は10または11桁の数字のみ入力してください')
      end
      it 'telが数字以外の場合保存できない' do
        @purchase_address.tel = '090-1234-abcd'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel は10または11桁の数字のみ入力してください')
      end
      it 'userが紐づいていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
