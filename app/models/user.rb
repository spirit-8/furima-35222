class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchases
  
  zenkaku = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  kanamoji = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :last_name, format: { with: zenkaku, message:"全角文字で入力してください" }
    validates :first_name, format: { with: zenkaku, message:"全角文字で入力してください" }
    validates :last_kana, format: { with: kanamoji, message:"全角カナ文字で入力してください" }
    validates :first_kana, format: { with: kanamoji, message:"全角カナ文字で入力してください" }
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message:"英数混合で入力してください"
  validates_uniqueness_of :email, message:"このメールアドレスは使用されています"
end
