class Promotion < ActiveRecord::Base
  has_many :order_promotions
end
