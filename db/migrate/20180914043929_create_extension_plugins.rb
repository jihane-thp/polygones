class CreateExtensionPlugins < ActiveRecord::Migration[5.2]
  def change
    create_table :extension_plugins do |t|
      t.string :name
      t.string :slug
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
