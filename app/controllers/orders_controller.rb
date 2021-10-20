class OrdersController < ApplicationController

before_action :set_item, :authenticate_user!

def index
  @order = Order.new
 end

 def create
  @order = Order.create(order_params)
  Address.create(address_params)
  redirect_to root_path
end


private
 def set_item
    @item = Item.find(params[:item_id])
    # if @item.oder_id
    #   redirect_to item_path(@item.id), alert: '売り切れのため、購入できません'
    # end
  end

  def order_params
    params.require(:order).permit(:item_id).merge(item_id: @item.id)
    params.require(:order).permit(:user_id).merge(user_id: current_user.id,)
  end
  
  def address_params   
      params.permit(:postal_code, :prefecture_id, :city_town, :address_number, :building, :phone_number ) 
  end

end
