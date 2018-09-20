class CreateOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_products do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :product, foreign_key: true
    end
  end
end
