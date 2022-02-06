class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :days_post_id, :price, :image).merge(user_id: current_user.id)
  end
end
