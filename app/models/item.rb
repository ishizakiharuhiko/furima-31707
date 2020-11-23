class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
    validates :price, 
        numericality: {
         :only_integer: true 
         :less_than => 10000000
         :greater_than => 299
      } 
  end

  belungs_to :user
  has_one_attached :image

end