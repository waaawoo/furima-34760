class BuyerHistoryController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :item_id, only: %i[index]


  def index
  end

  def new

  end
  private

  def item_id
    @item = Item.find(params[:item_id])
  end
end
