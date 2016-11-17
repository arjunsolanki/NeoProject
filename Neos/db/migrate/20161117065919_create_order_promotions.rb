class CreateOrderPromotions < ActiveRecord::Migration
  def change
    create_table :order_promotions do |t|
      t.references :promotion, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
