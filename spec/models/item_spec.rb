require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'image item_name description category_id status_id delivery_fee_id shipping_address_id until_shipping_id priceが存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'item_nameが空では登録できないこと' do
      @item.item_name = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが初期値だと登録できないこと' do
      @item.category_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが初期値だと登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'delivery_fee_idが初期値だと登録できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end

    it 'shipping_address_idが初期値だと登録できないこと' do
      @item.shipping_address_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping address must be other than 1")
    end

    it 'until_shipping_idが初期値だと登録できないこと' do
      @item.until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Until shipping must be other than 1")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil 
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300円未満では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが10,000,000円以上では登録できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが半角数字でなければ登録できないこと' do
      @item.price = "３００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end