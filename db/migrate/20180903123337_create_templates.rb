class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string  :name
      t.string  :slug
    #  t.integer :view_articles
      t.string :logo
      t.boolean :purchased
      t.belongs_to :site, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end

end
