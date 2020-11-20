class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[[ぁ-んァ-ン一-龥]]+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :kana_first_name
      validates :kana_last_name
    end
  end
end
