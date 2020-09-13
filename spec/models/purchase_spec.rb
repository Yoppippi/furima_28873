require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入' do
    before do
      @purchase = FactoryBot.build(:user_purchase)
    end

    context '商品購入がうまくいくとき' do
      it 'token postal_code prefecture_id city block building phone_number が存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '建物名が空でも登録できる' do
        @purchase.building = ''
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフーンがないと登録できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが初期値だと登録できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと登録できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと登録できない' do
        @purchase.block = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberはハイフーンがあると登録できない' do
        @purchase.phone_number = '080-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @purchase.phone_number = '08012345678912'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
