class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :page_transition, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
   
  end

  def create
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
    params.require(:purchase_address).permit(:postal_code, :delivery_area_id, :municipalities, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pry_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], 
      currency: 'jpy' 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def page_transition
    if current_user == @item.user 
      redirect_to root_path and return 
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

end
