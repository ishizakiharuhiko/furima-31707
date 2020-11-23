class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end


  private

  def items_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_id, :prefecture_id, :day_id, :price,:image).merge(user_id: current_user.id)
  end

end
