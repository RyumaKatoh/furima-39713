class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  # ユーザー名（漢字）は必須であることをバリデーション
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true

  # ユーザー名（カナ）は必須であることと、カタカナでの入力をバリデーション
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ }

  # 誕生日は必須であることをバリデーション
  validates :birthday, presence: true

  # メールアドレスは必須であること、一意であること、@を含む必要があることをバリデーション
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  # パスワードは必須であること、6文字以上での入力が必須であることをバリデーション
  validates :password, presence: true, length: { minimum: 6 }

  # パスワード（確認）との一致をバリデーション
  validate :password_confirmation_matches

  private

  def password_confirmation_matches
    if password.present? && password_confirmation.blank?
      errors.add(:password_confirmation, "パスワード（確認）を入力してください")
    elsif password != password_confirmation
      errors.add(:password_confirmation, "パスワードとパスワード（確認）が一致しません")
    end
  end
end





 
