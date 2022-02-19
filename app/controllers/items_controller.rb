class ItemsController < ApplicationController
  # ユーザー管理機能の時点では不要なためコメントアウト
  # before_action :move_to_index, except: [:index, :show]

  def index
    @items = Items.all
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

  # ユーザー管理機能の時点では不要なためコメントアウト
  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :burden_of_shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price, :user_id)
  end

  # def move_to_index
    # redirect_to action: :index unless user_signed_in?
  # end
end
