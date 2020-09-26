class UserPurchase
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{10,11}\z/.freeze

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token, :transaction_id

  validates :token, :postal_code, :city, :block, :phone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: POSTAL_CODE_REGEX }
  validates :phone_number, format: { with: PHONE_NUMBER_REGEX }

  def save
    transaction = Transaction.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, transaction_id: transaction.id)
  end
end
