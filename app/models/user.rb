class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }
    validates :nickname
    validates :first_name, format: { with: /\A[[ぁ-んァ-ン一-龥]]+\z/ }
    validates :last_name, format: { with: /\A[[ぁ-んァ-ン一-龥]]+\z/ }
    validates :kana_first_name, format: { with: /\A[ァ-ン]+\z/ }
    validates :kana_last_name, format: { with: /\A[ァ-ン]+\z/ }
    validates :birthday
  end
end
