class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  has_many :order_promotions
  before_create :set_order_status
  #before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = subtotal
  end

  private
    def set_order_status
      self.order_status_id = 1
    end
end
