class SendingDestination < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code, :prefecture_code, :address_city, :address_street, :destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, presence: true
  validates :destination_family_name_kana, :destination_first_name_kana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナのみで入力して下さい"
                 }
  validates :destination_family_name, :destination_first_name, presence: true,
                 format: {
                   with: /\A[ぁ-んァ-ン一-龥]/,
                   message: "全角のみで入力して下さい"
                 }


  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  

end
