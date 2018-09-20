class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
    	t.string :title
    	t.text :content
      t.string :slug
    	t.integer :hits, default: 0
      t.string :image, optional: true

      t.belongs_to :user
      t.belongs_to :category, optional: true
    	t.belongs_to :site
      t.timestamps
    end
  end
end
