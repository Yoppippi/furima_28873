class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references   :transaction,         null: false, foreign_key: true
      t.string       :postal_code,         null: false
      t.integer      :prefecture_id,       null: false
      t.string       :city,                null: false
      t.string       :block,               null: false
      t.string       :building
      t.integer      :phone_number,        null: false

      t.timestamps
    end
  end
end