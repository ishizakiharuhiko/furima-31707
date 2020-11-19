require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "emailとpassword、password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.encrypted_password = "111aaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが＠を含まない場合登録できない" do
      end
      it "passwordが空では登録できない" do
        @user.encrypted_password = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Encrypted_password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.encrypted_password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        @user.encrypted_password = "111aaa"
        @user.password_confirmation = "222bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("")
      end
    end
  end
end