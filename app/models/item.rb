class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :until_shipping
  belongs_to :user
  has_one_attached :image
  # has_one :transaction

  validates :image, :item_name, :description, :category, :status, :delivery_fee, :shipping_address, :until_shipping, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
  validates :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :until_shipping_id, numericality: { other_than: 1 }
end
