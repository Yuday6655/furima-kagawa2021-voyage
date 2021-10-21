class OrdersController < ApplicationController

before_action :set_item, :authenticate_user!

def index
  @order_address = OrderAddress.new
 end

def create
   @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
        render :index
    end
end

 private

  def set_item
    #購入品の情報の取得
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: prams[:token])
  end


  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ).merge(order_id: @order.id)
  end

end
