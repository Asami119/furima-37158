class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
 
  def create
    @purchase = Purchase.create(purchase_params)
    Shipping.create(shipping_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def shipping_params
    params.permit(:postcode, :prefecture_id, :address_city, :address_block, :address_building, :phone_number).merge(purchase_id: @purchase.id)
  end
end
