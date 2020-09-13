class Transaction < ApplicationRecord
  belongs_to :item
  has_one :purchase
  belongs_to :user
end
