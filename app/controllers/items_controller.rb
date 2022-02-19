class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
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

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :category_id, :product_condition_id, :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price, :user_id).merge(user_id: current_user.id)
  end

   def move_to_index
     redirect_to new_user_session_path unless user_signed_in?
   end
end
