class CreateTabs < ActiveRecord::Migration[5.2]
  def change
    create_table :tabs do |t|
      t.string :title
      t.string :url
      t.integer :order
      t.belongs_to :site, index: true
      t.references :item, polymorphic: true, index: true
      t.boolean :home

      t.timestamps
    end
  end
end
