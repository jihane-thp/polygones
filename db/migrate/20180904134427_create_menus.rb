class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|

      #t.belongs_to :site, foreign_key: true

      t.timestamps
    end
  end
end
