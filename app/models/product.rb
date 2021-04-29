class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: "カテゴリーを選択してください" }
    validates :status_id, numericality: { other_than: 1, message: "商品の状態を選択してください" }
    validates :delivery_charge_id, numericality: { other_than: 1, message: "配送料の負担を選択してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "配送元の地域を選択してください" }
    validates :until_delivery_id, numericality: { other_than: 1, message: "発送までの日数を選択してください" }
    validates :price, format: { with: "/\A[0-9]+\z/", message: "半角数字で入力してください" }
  end

  extend ActiveHash::Assoiations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :until_delivery



end
