class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :order

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :street
    validates :telephone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  validates :building_name
end
