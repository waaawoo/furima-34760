class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション 6以上半角英数字混合必須
  validates :password, length:{minimum: 6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  # から判定
  validates :name, presence: true
  # 全角のみ
  validates :f_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  # 全角のみ
  validates :l_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  # 全角カタカタ
  validates :f_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  # 全角カタカタ
  validates :f_name_kana, presence: true,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  # から判定
  validates :birthday, presence: true
end
