class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(items_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def items_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
