class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :template

      t.belongs_to :order
      t.belongs_to :user

      t.timestamps
    end
  end
end
