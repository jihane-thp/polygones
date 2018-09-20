class Product < ApplicationRecord
	has_many :cart_products
	has_many :carts, through: :cart_products
	has_and_belongs_to_many :orders

	validates :title, :price, presence: true
	validates :price, numericality: { greather_than_or_equal_to: 1 }
	validates :title, uniqueness: { case_sensitive: false }

	has_many :templates
  has_many :sites, through: :templates

end
