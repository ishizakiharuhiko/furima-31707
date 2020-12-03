class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.save
      @address = Address.new(address_params)
      @address.save
      return redirect_to item_path(@item)
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def address_params
    params.permit(
      :postal_number, :prefecture_id, :city, :street, :building_name, :telephone_number
      ).merge(order_id: @order.id)
  end

end