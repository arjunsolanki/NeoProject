class BasketsController < ApplicationController
  def show
    @order_items = active_order.order_items
  end
end
