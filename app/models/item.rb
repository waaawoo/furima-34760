class Item < ApplicationRecord

  # バリデーション
  # から判定
  with_options presence: true do
    validates :name
    validates :text
    validates :price

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
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_burden
  belongs_to :delivery_time

end
