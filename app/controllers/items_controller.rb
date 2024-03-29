class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :page_transition, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path and return
    unless @item.user.id == current_user.id
      redirect_to action: :index
    else
      render action: :destroy, except: [:destroy]
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id, :condition_id, :delivery_charge_id, :delivery_day_id, :delivery_area_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def page_transition
    unless @item.user_id == current_user.id && !@item.purchase.present?
      redirect_to action: :index
    end
  end

 

end
