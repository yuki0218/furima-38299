class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index1, only: [:edit, :destroy]
  before_action :move_to_index2, only: :edit
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
    @purchase_items_id = PurchaseRecord.pluck(:item_id)
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
    @purchase_items_id = PurchaseRecord.pluck(:item_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :send_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index1
    unless current_user.id == Item.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  def move_to_index2
    if PurchaseRecord.pluck(:item_id).include?(params[:id].to_i)
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
