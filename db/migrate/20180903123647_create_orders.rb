class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :price, precision: 6, scale: 2

      t.belongs_to :user
      #t.belongs_to :cart

      t.timestamps
    end
  end
end
