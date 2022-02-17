class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postcode, :prefecture_id, :address_city, :address_block, :address_building,
                                              :phone_number, :item_id).merge(
                                                user_id: current_user.id, item_id: @item.id, token: params[:token]
                                              )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.purchase.blank? == false
      redirect_to root_path
    end
  end
end
