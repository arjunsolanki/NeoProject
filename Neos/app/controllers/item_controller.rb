class ItemController < ApplicationController
  def index
    @items = Item.all
    @order_item = active_order.order_items.new
  end
end
