class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(id: 'DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    redirect_to item_path(item.id) unless current_user.id == item.user_id
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :detail, :image, :category_id, :quality_id, :shipping_fee_id, :prefecture_id,
                                 :shipment_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
