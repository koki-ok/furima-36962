require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できるとき' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'category_idがなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'product_condition_idがなければ登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end
      it 'product_condition_idが1では登録できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end
      it 'burden_of_shipping_charge_idがなければ登録できない' do
        @item.burden_of_shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it 'burden_of_shipping_charge_idが1では登録できない' do
        @item.burden_of_shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden of shipping charge can't be blank"
      end
      it 'shipping_area_idがなければ登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'shipping_area_idが1では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'days_to_ship_idがなければ登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'days_to_ship_idが1では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it '価格の情報がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が¥299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が¥10,000,000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it '価格は半角数値以外では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
