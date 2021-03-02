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
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
      validates :f_name
      validates :l_name
    end
    # 全角カタカナのみ
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :f_name_kana
      validates :l_name_kana
    end

    validates :birthday
  end

end
