class AddArticlesCountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :articles_count, :integer, default: 0 
  end
end
