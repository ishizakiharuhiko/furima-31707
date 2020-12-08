class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :buyer_confirmation, only: [:index]

  def index
    @order = Order.new
    @address = Address.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      @address = Address.new(address_params)
      @address.save
      return redirect_to item_path(@item)
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(
      :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
  
  def address_params
    params.require(:address).permit(
      :postal_number, :prefecture_id, :city, :street, :building_name, :telephone_number
      ).merge(order_id: @order.id)
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
  end

  def buyer_confirmation
    redirect_to root_path if current_user == @item.user
  end

  def buyed_item_confirmation
    redirect_to root_path if Order.ids.include (@item.id)
  end
end