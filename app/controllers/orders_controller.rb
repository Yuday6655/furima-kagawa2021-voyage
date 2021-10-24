class OrdersController < ApplicationController

before_action :set_item, :move_to_root_path, :authenticate_user!

def index
  if current_user.id == @item.user_id
    redirect_to root_path
  else
    @order_address = OrderAddress.new
  end
end

def create
   @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
        render :index
    end
end

 private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

  def move_to_root_path
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ).merge(order_id: @order.id)
  end

end
