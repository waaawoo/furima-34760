class BuyerHistory < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :buyer_infos
end
