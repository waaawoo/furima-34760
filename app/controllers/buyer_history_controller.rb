class BuyerHistoryController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :set_item, only: %i[index]


  def index
    @buyer_history_info = BuyerHistoryInfo.new
  end

  def create
    @buyer_history_info = BuyerHistoryInfo.new(history_params)
    if @buyer_history_info.valid?
      @buyer_history_info.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def history_params
    params.require(:buyer_history_info).permit(
      :post_num,
      :area_id,
      :municipalities,
      :address,
      :builing_name,
      :phone_num
    ).merge(
      user_id: current_user.id,
      item_id: set_item.id,
      )
  end
end
