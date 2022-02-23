class PurchasesController < ApplicationController
  before_action :authenticate_user!, expect: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :shipping_area_id, :municipalities, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id)
  end

end
