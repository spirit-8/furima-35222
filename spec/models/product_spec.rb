require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'すべて正しく入力できていれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '商品画像がないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリ情報が選択されていないと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category カテゴリーを選択してください")
      end
      it '商品状態が選択されていないと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status 商品の状態を選択してください")
      end
      it '配送料の負担が選択されていないと出品できない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge 配送料の負担を選択してください")
      end
      it '配送元の地域が選択されていないと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture 配送元の地域を選択してください")
      end
      it '発送までの日数が選択されていないと出品できない' do
        @product.until_delivery_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Until delivery 発送までの日数を選択してください")
      end
      it '価格が空だと出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300~¥9,999,999の間でないと出品できない' do
        @product.price = "100"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end
      it '価格は¥300~¥9,999,999の間でないと出品できない' do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 9999999")
      end
      it '価格は半角数字でないと出品できない' do
        @product.price = "５００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is too short (minimum is 3 characters)", "Price is not a number")
      end
    end
  end
end
