class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :encrypted_password, presence: true, format: { with: /\A[a-zA-Z\d]{6,}+\z/ }
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[[ぁ-んァ-ン一-龥]]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[[ぁ-んァ-ン一-龥]]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birthday, presence: true
end
