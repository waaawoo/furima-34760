class Item < ApplicationRecord

  # バリデーション
  # から判定
  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :category_id
    validates :delivery_burden_id
    validates :area_id
    validates :delivery_time_id
  end
end
