class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 空判定
  with_options presence: true do
    # 6以上半角英数字混合必須
    validates :password, length:{minimum: 6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :name
    # 全角のみ
    validates :f_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    validates :l_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
    # 全角カタカナのみ
    validates :f_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
    validates :l_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
    validates :birthday
  end

end
