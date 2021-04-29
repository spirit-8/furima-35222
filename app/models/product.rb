class Product < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  extend ActiveHash::Assoiations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sutatus
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :until_delivery


  validates :category_id, numericality: { other_than: 1 }
  validates :sutatus_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :until_delivery_id, numericality: { other_than: 1 }
end
