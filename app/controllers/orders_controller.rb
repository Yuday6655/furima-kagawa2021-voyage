class OrdersController < ApplicationController

before_action :set_order, :authenticate_user!

def index
end

 def create
 end



private
 def set_order
    #購入品の情報の取得
    @item = Item.find(params[:item_id])

    # if @item.oder_id
    #   redirect_to item_path(@item.id), alert: '売り切れのため、購入できません'
    # end
  end
end
