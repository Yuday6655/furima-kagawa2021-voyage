class ItemsController < ApplicationController
    def index
      
    end

    def new
      @items = Item.new
    end

 private
  def item_params
    params.require(:item).permit(:title, :detail, :image, :category, :quality, :shipping_fee, :prefecture, :shipment_date, :price)
end
