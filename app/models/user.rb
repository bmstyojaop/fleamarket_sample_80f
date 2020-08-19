class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  mount_uploader :background, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
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
  
  validates :nickname, presence: true, length: { maximum: 20 }


  has_one :sending_destination 
  # has_many :seller_items, foreign_key: 'seller_id', class_name: 'Item'
  # has_many :buyer_items, foreign_key: 'buyer_id', class_name: 'Item'

  has_many :items,     dependent: :destroy

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }


  end
end
