class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :order

  with_options presence: true do
    validates :postal_number
    validates :prefecture_id
    validates :city
    validates :street
    validates :telephone_number
  end

  validates :building_name
end
