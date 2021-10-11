class ItemsController < ApplicationController
    def index
      
    end

    def new
      @items = Item.new
    end
end
