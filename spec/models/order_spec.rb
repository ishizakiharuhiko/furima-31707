require 'rails_helper'
describe Order do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入' do
    context '商品購入がうまくいくとき' do
      it 'トークンが存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end
  end

    context '商品購入がうまくいかないとき' do
      it 'トークンが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end

end
