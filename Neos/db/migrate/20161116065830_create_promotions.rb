class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :code
      t.string :reduction
      t.string :reduction_type
      t.boolean :is_conjunction 
      t.boolean :status
      t.timestamps null: false
    end
  end
end
