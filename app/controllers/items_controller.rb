class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def crate
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :text,
      :image,
      :category_id,
      :condition_id,
      :delivery_burden_id,
      :area_id,
      :delivery_time_id,
      :price
      ).merge(user_id: current_user.id)
  end
end
