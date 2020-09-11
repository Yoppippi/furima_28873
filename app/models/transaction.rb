class Transaction < ApplicationRecord
  belongs_to :item
  has_one :purchase
  belongs_to :user

  # validates :title, :text, :genre, presence: true
end
