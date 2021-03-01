class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :nickname, presence: true
  validates :f_name, presence: true
  validates :l_name, presence: true
  validates :f_name_kana, presence: true
  validates :l_name_kana, presence: true
  validates :birthday, presence: true
end
