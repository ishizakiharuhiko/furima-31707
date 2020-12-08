class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :addresses
  attr_accessor :token

  validates :token, presence: true
end
