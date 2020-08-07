class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :item_condition
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  # belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
end
