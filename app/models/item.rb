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

  # アソシエーション
  belonsg_to :user
  belonsg_to :area
  belonsg_to :category
  belonsg_to :condition
  belonsg_to :delivery_burden
  belonsg_to :delivery_time

end
