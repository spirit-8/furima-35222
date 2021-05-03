class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  hankaku = /\A[0-9]+\z/

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: "カテゴリーを選択してください" }
    validates :status_id, numericality: { other_than: 1, message: "商品の状態を選択してください" }
    validates :delivery_charge_id, numericality: { other_than: 1, message: "配送料の負担を選択してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "配送元の地域を選択してください" }
    validates :until_delivery_id, numericality: { other_than: 1, message: "発送までの日数を選択してください" }
    validates :price, format: { with: hankaku }, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :until_delivery



end
