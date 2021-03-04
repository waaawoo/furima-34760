class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :exists_check, only: [:edit, :update, :show, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]



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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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

  def exists_check
    unless Item.exists?(id: params[:id])
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

end
