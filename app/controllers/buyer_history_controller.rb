class BuyerHistoryController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  before_action :set_item, only: %i[index]
  before_action :user_check, only: [:index]


  def index
    @buyer_history_info = BuyerHistoryInfo.new
  end

  def create
    @buyer_history_info = BuyerHistoryInfo.new(history_params)
    if @buyer_history_info.valid?
      pay_item
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
      token: params[:token]
      )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @buyer_history_info.token,
      currency: 'jpy'
    )
  end

  def user_check
    # 出品者NG
    redirect_to root_path if @item.user_id == current_user.id
    # 販売済みNG
    unless @item.buyer_historys.blank?
      redirect_to root_path
    end

  end
end
