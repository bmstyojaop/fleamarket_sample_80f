class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :item_images, dependent: :destroy
  # belongs_to :category
  belongs_to_active_hash :postage_type, dependent: :destroy
  belongs_to_active_hash :preparation_day, dependent: :destroy
  belongs_to_active_hash :postage_payer, dependent: :destroy
  belongs_to_active_hash :item_condition, dependent: :destroy
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  # belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'


  belongs_to_active_hash :category, dependent: :destroy
  belongs_to_active_hash :shipping_origin, dependent: :destroy

  has_many :images, dependent: :destroy
 
  validates :item_name,                    presence: true,    length: { maximum: 40 } 
  validates :item_introduction,            presence: true,    length: { maximum: 1000 } 
  validates :category_id,                  presence: true
  validates :item_condition_id,               presence: true
  validates :auction_status,               presence: true
  validates :postage_payer_id,                presence: true
  validates :postage_type_id,                presence: true
  validates :shipping_origin_id,              presence: true
  validates :preparation_day_id,              presence: true
  validates :price,                        presence: true
  validates :images,                       presence: true

  validates_associated :images

  enum auction_status: {出品中: 1, 売り切れ: 2}
  accepts_nested_attributes_for :images, allow_destroy: true

end
