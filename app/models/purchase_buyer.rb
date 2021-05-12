class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :zip_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}, length: {maximum: 11}
    validates :token
  end


  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Buyer.create(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
