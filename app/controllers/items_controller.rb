class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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
    redirect_to root_path if @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:item).permit({images: []}).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id,
                                 :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price, :user_id, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect
    redirect_to root_path if current_user.id != @item.user_id
  end
end
