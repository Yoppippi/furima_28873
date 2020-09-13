class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @transactions = Transaction.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @transactions = Transaction.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def ensure_correct_user
    @item = Item.find(params[:id])
    redirect_to(root_path) if user_signed_in? && current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :until_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
