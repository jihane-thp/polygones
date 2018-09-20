class Tab < ApplicationRecord

  validates :title,:item, presence: true

  belongs_to :site
  belongs_to :item, polymorphic: true
  enum nature: {category: "Category", article: "Article"}




end
