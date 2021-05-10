require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@purchase_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できない' do
        @purchase_buyer.zip_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid")
      end
      it 'zip_codeがハイフンを含んだ形式でないと保存できない' do
        @purchase_buyer.zip_code = '1234567'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Zip code is invalid")
      end
      it 'zip_codeが全角では保存できない' do
        @purchase_buyer.zip_code = '１２３-４５６７'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Zip code is invalid")
      end
      it 'prefecyure_idが1では保存できない' do
        @purchase_buyer.prefecture_id = 1
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'addressが空だと保存できない' do
        @purchase_buyer.address = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @purchase_buyer.municipality = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'buildingは空でも保存できる' do
        @purchase_buyer.building = ''
        expect(@purchase_buyer).to be_valid
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_buyer.phone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが全角では保存できない' do
        @purchase_buyer.phone_number = '０９０１２３４５６７８'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁以内でないと保存できない' do
        @purchase_buyer.phone_number = '090123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
