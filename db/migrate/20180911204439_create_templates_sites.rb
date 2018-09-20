class CreateTemplatesSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites_templates do |t|
      t.belongs_to :site, index: true
      t.belongs_to :template, index: true

      t.timestamps
    end
  end
end
