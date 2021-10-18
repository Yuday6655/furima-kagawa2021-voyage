class OrdersController < ApplicationController

before_action :set_item, :authenticate_user!

def index
  @order = Order.new
end

 def create
  @order = Order.new(order_params)
  if @order.valid?
    @order.save
    return redirect_to root_path
  else
    render 'index'
  end
end



private
 def set_item
    #購入品の情報の取得
    @item = Item.find(params[:item_id])

    # if @item.oder_id
    #   redirect_to item_path(@item.id), alert: '売り切れのため、購入できません'
    # end
  end

  def order_params     #price ではなく、カード情報などが入る？
    params.require(:order).permit(:price) .merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
