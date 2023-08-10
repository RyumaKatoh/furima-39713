class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :purchases

  # バリデーション設定
  validates :nickname, presence: true

  # 全角文字指定のバリデーション
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name_kanji
    validates :last_name_kanji
  end
  # 全角カナ指定のバリデーション
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  
  # 誕生日は必須であることをバリデーション
  validates :birthday, presence: true

   # パスワードが英数字6文字以上での入力が必須であることをバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' 
  
  # 全角文字を含むパスワードでは登録できない
  PASSWORD_REGEX = /\A[a-zA-Z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. The password cannot contain full-width characters.' 
end





 
