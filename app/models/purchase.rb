class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :transaction

  validates :postal_code, :city, :block, :phone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 1 } 
end
