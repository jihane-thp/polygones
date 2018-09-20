module Admin

	class CartProductsController < Admin::ApplicationController

		include CurrentCart

		before_action :set_cart, only: [:add, :remove]
		before_action :set_cart_product, only: [:show, :edit, :update, :destroy]

		def index
			@cart_products = CartProduct.all
		end

		def show

		end

		def new
			@cart_product = CartProduct.new
		end

		def edit

		end

		def add
			product = Product.find(params[:product_id])

			@cart_product = @cart.add_product(product)

			respond_to do |format|
				if @cart_product.save
					format.html {redirect_to @cart_product.cart, notice: 'Cart product was successfully created'}
					format.js
				else
					format.html { render :new}
				end
			end
		end

		def remove

			@product = Product.find(params[:product_id])
			@cart.products.delete(@product)

			@product = params[:product_id]

			respond_to do |format|
				format.html { redirect_to cart_url }
				format.js
			end
		end



		def update
			respond_to do |format|
				if @cart_product.update(cart_product_params)
					format.html {redirect_to @cart_product, notice: 'cart_product was successfully updated.'}
				else
					format.html { render :edit }
				end
			end
		end

		def destroy
			@cart_product.destroy
			respond_to do |format|
				format.html { redirect_to cart_products_url, notice: 'Cart product was successfully destroyed.'}
			end
		end

		private
		def set_cart_product
			@cart_product = CartProduct.find(params[:id])
		end


		def cart_product_params
			params.fetch(:cart_product, {})
		end


	end
end
