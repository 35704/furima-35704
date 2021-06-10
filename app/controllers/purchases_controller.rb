class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pry_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :delivery_area_id, :municipalities, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def pry_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: purchase_params[:token], 
      currency: 'jpy' 
    )
  end

end
