class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  mount_uploader :background, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  validates :family_name, :first_name, presence: true,
                 format: {
                   with: /\A[ぁ-んァ-ン一-龥]/,
                  #  message: "全角のみで入力して下さい"
                 }
                 
  validates :family_name_kana, :first_name_kana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                  #  message: "全角カタカナのみで入力して下さい"
                 }
  
  validates :nickname, presence: true, length: { maximum: 10 }


  # has_many :seller_items, foreign_key: 'seller_id', class_name: 'Item'
  # has_many :buyer_items, foreign_key: 'buyer_id', class_name: 'Item'

  validates :nickname, presence: true
  has_one :sending_destination
  has_one :credit_card, dependent: :destroy
  has_many :items,     dependent: :destroy
end
  