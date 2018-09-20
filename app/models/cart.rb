class Cart < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :user, optional: true

	has_many :cart_products
	has_many :products, through: :cart_products

	def total
		total = 0
		for product in self.products
				total = total + product.price
		end
		total
	end

	  def add_product(product_id)

	    current_product = cart_products.where(:product_id => product_id).first

	    if current_product

	      current_product.quantity += 1

	    else

	      current_product = CartProduct.new(:product_id=>product_id)

	      cart_products << current_product

	    end

	    current_product
	  end

end
