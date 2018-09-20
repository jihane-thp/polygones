class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url, optional: true
      t.string :slogan, optional: true
      t.string :meta_description, optional: true
      t.string :meta_title, optional: true

      t.belongs_to :user, index: true
      
      #t.belongs_to :menu#, optional: true

      t.belongs_to :template, optional: true
      t.belongs_to :category, optional: true

      t.timestamps
    end
  end

end
