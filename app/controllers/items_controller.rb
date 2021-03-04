class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if Item.exists?(id: params[:id])
      @item = Item.find(params[:id])
    else
      redirect_to root_path
    end

  end

  def edit
    if Item.exists?(id: params[:id])
      @item = Item.find(params[:id])
      if @item.user_id != current_user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def update
    if Item.exists?(id: params[:id])
      @item = Item.find(params[:id])
      if @item.user_id == current_user.id
        if @item.update(item_params)
          redirect_to root_path
        else
          render :edit
        end
      end
    else
      redirect_to root_path
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
