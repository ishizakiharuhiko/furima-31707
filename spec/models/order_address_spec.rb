require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it 'token,postal_number,prefecture_id, city, street, telephone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it 'トークンが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_numberが空では購入できない' do
        @order_address.postal_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'postal_numberにハイフンがなければ購入できない' do
        @order_address.postal_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal number is invalid')
      end
      it 'postal_numberが数字でなければ購入できない' do
        @order_address.postal_number = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal number is invalid')
      end
      it 'prefecture_idが空では購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では購入できない' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが半角数字でなければ購入できない' do
        @order_address.telephone_number = '電話番号'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is not a number')
      end
    end
  end
end
