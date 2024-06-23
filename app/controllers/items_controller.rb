class ItemsController < ApplicationController
  def index
    @item = Item.All
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :content, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
