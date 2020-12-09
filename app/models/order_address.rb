class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_number, :prefecture_id, :city, :street, :building_name, :telephone_number

  with_options presence: true do
    validates :token
    validates :item_id
    validates :postal_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street
    validates :telephone_number, numericality: { only_integer: true }, length: { maximum: 11 }
  end

  validate :building_name

  def save
    order = Order.create(token: params[:token], item_id: item_id, user_id: current_user.id)
    Address.create(
      postal_number: postal_number, prefecture_id: prefecture_id, city: city, street: street, telephone_number: telephone_number, building_name: building_name, oredr_id: order.id
    )
  end
end
