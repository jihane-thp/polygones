class CreatePluginsSites < ActiveRecord::Migration[5.2]
  def change
    create_table :plugins_sites do |t|
      t.belongs_to :plugin, foreign_key: true
      t.belongs_to :site, foreign_key: true
    end
  end
end
