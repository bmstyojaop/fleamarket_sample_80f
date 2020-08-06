class SendingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code, :prefecture_code, :city, :house_number, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, presence: true
end
