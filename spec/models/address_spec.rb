require 'rails_helper'
describe Address do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品の購入後の住所登録' do
    context '登録がうまくいくとき' do
      it 'postal_number,prefecture_id, city, street, telephone_numberが存在すれば登録できる' do
        expect(@address).to be_valid
      end
      it 'building_nameは存在しなくても登録できる' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '住所登録がうまくいかないとき' do
      it 'postal_numberが空では登録できない' do
        @address.postal_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal number can't be blank")
      end
      it 'postal_numberにハイフンがなければ登録できない' do
        @address.postal_number = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal number is invalid")
      end
      it 'postal_numberが数字でなければ登録できない' do
        @address.postal_number = 'abc-defg'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal number is invalid")
      end
      it 'prefecture_idが空では登録できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @address.prefecture_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では登録できない' do
        @address.street = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @address.telephone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが半角数字でなければ登録できない' do
        @address.telephone_number = '電話番号'
        @address.valid?
        expect(@address.errors.full_messages).to include("Telephone number is not a number")
      end
    end
  end
end