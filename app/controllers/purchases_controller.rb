class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_author, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase = Purchase.new
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      update_item_sold_out(@purchase_address.item_id)
      pay_item
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :shipping_area_id, :city, :address1, :address2,
                                             :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def redirect_if_not_author
    @item = Item.find(params[:item_id])
    return unless @item.user_id == current_user.id || @item.purchase.present?

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end

  def update_item_sold_out(item_id)
    @item = Item.find(item_id)
    @item.update(sold_out: true)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
