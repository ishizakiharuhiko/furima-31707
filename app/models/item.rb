class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end

  belungs_to :user
  has_one_attached :image

end
