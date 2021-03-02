class Item < ApplicationRecord

  # バリデーション
  # から判定
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, :numericality => { :greater_than_or_equal_to => 300 }
    validates :price, :numericality => { :less_than => 10000000 }
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :area_id
      validates :category_id
      validates :condition_id
      validates :delivery_burden_id
      validates :delivery_time_id
    end
  end

  # モジュールの取り込み
  extend ActiveHash::Associations::ActiveRecordExtensions

 # アソシエーション
  belongs_to :user

  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  # belongs_to_active_hash :delivery_burden
  # belongs_to_active_hash :delivery_time

  has_one_attached :image

end
