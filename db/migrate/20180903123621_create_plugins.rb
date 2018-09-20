class CreatePlugins < ActiveRecord::Migration[5.2]
  def change
    create_table :plugins do |t|
      t.boolean :is_activated, default: false
      t.string :name
      t.timestamps
      t.belongs_to :site
      t.belongs_to :extension_plugin

    end
  end
end
