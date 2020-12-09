class OrdersController < ApplicationController
  before_action :set_item
  before_action :set_order_all, only: [:index]
  before_action :authenticate_user!, only: [:index]
  before_action :buyer_confirmation, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to item_path(@item)
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order_all
    @orders = Order.all
  end

  def order_params
    params.require(:order_address).permit(
      :token, :postal_number, :prefecture_id, :city, :street, :building_name, :telephone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def buyer_confirmation
    redirect_to root_path unless current_user != @item.user || @item.order.blank?
  end
end
