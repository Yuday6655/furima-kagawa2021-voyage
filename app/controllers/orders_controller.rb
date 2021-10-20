class OrdersController < ApplicationController

before_action :set_item, :authenticate_user!

def index
  @order_address = OrderAddress.new
 end

 def create
  @order_address = OrderAddress.new(order_params)
 end
 private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
