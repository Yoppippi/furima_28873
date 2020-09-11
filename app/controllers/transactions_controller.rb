class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :ensure_correct_user, only: [:index, :create]
  before_action :purchased, only: [:index, :create]
  before_action :set_item, only: [:index, :create]


  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number, :token, :item_id, :transaction_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: params['token'],    
      currency:'jpy'                
    )
  end

  private

  def ensure_correct_user
    @item = Item.find(params[:item_id])
    redirect_to(root_path) if user_signed_in? && current_user.id == @item.user_id
  end

  def purchased
    @transactions = Transaction.all
    redirect_to(root_path) if @transactions.exists?(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
