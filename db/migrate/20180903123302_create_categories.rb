class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.belongs_to :site

      t.timestamps
    end
  end
end
