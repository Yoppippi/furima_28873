class ChangeTypeIntToStringPurchase < ActiveRecord::Migration[6.0]
  def change
    change_column :purchases, :phone_number, :string
  end
end
