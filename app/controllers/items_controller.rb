class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :until_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

end
