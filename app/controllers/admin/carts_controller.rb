module Admin

	class CartsController < Admin::ApplicationController
		rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found

		include CurrentCart
		before_action :set_cart, only: [:show, :edit, :update, :destroy,:address,:recap,:complete]

		def index
		end

		def add
			product = Product.find(params[:product_id])
			if(@user.cart.products.exists?(params[:product_id]))
			else
				@user.cart.products << product
			end
			redirect_to admin_products_path
		end

		def remove
			product = Product.find(params[:product_id])
			if(@user.cart.products.exists?(params[:product_id]))
				@user.cart.products.delete(product)
			else
			end
			redirect_to admin_products_path
		end

		def show
		end

		def new
			@cart = Cart.new
		end

		def edit
		end

		def create
			@cart = Cart.new(cart_params)

			respond_to do |format|
				if @cart.save
					format.html {redirect_to @cart, notice: 'Cart was successfully created.'}
				else
					format.html {render :new}
				end
			end
		end

		def update
			respond_to do |format|
				if @cart.update(cart_params)
					format.html {redirect_to @cart, notice: 'Cart was successfully updated.'}
				else
					format.html { render :edit }
				end
			end
		end

		def destroy
			return unless @cart.id == session{:cart_id} #verifie que l'id de l'user est bien l'id de la session (pour bien supprimer le bon panier)

			@cart.destroy #si c'est le cas, supprimer de la bdd grâce à destroy
			session.delete(:cart_id)#supprime la clé cart_id puis sa valeur de la session

			respond_to do |format|
				format.html { redirect_to root_url, notice: 'Votre panier est vide.'}
			end
		end


		private


		def cart_params
			params.fetch(:cart, {})
		end

		def cart_not_found
			redirect_to root_url, alert: t(".cart_not_found")
		end


	end

end
