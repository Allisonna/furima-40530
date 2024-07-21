class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_author, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
    respond_to do |format|
      format.html  # new.html.erb
      format.js    # new.js.erb
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '出品が完了しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def sold_out?
    sold_out
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_if_not_author
    return if current_user.id == @item.user_id

    redirect_to root_path
  end

  def redirect_if_sold_out
    return unless @item.sold_out? && current_user.id == @item.user.id

    redirect_to root_path, alert: '売却済み商品の編集はできません。'
  end

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :status_id, :shipping_cost_id, :shipping_area_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
