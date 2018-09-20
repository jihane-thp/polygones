module CurrentCart

	private

	def set_cart
		if current_user
			@user = current_user
			if ! current_user.cart.nil?
				puts "curent user exist je retourne le cart #{@current_user.cart.id}"
				@cart = current_user.cart
			else
				@cart = Cart.find_by(id: session[:cart_id]) || Cart.create
				current_user.cart = @cart
				@cart.save
				puts "curent user exist je créer un cart le cart #{@current_user.cart.id}"

			end
		else
			puts "pas de CurrentCart "

			@cart = Cart.find_by(id: session[:cart_id]) || Cart.create
			#current_user.cart = @cart
			#@cart.save
			#MAJ valeur en session sauf si déjà existante
		end

		session[:cart_id] ||= @cart.id

	end

end
