class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # has_many :seller_items, foreign_key: 'seller_id', class_name: 'Item'
  # has_many :buyer_items, foreign_key: 'buyer_id', class_name: 'Item'
  validates :nickname, presence: true
  has_one :sending_destination
  has_one :card, dependent: :destroy

end
  