class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_many :orders
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :prefecture_id
      validates :day_id
    end

    validates :price,
              numericality: {
                only_integer: true,
                less_than: 10_000_000,
                greater_than: 299
              }
  end
end
