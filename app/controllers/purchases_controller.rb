class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_record = AddressRecord.new
  end

  def create
    @address_record = AddressRecord.new(purchase_params)
    if @address_record.valid?
      @address_record.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_params
    params.require(:address_record).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
