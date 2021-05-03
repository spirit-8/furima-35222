class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :until_delivery_id
    end
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :until_delivery



end
