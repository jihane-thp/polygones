module Admin

  class OrdersController < Admin::ApplicationController
    include CurrentCart
    before_action :set_cart, only: [:new, :create]
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_cart_is_empty, only: :new

    def buy

      @total = @user.cart.total
      @total_stripe = @user.cart.total  * 100

    end

    def pay
      # Amount in cents
      @total = @user.cart.total
      @total_stripe = @user.cart.total  * 100

      @amount = @user.cart.total  * 100

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Paiement template',
        :currency    => 'eur'
      )

      order = Order.new(user: @user)

      for product in @user.cart.products
        order.products << product

        template = Template.create(site: @site, product: product, slug: product.title)

        product.update(sale: (product.sale + 1))
      end

      order.price = @user.cart.total

      order.save
      @user.update(cart: Cart.create)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end


    def index
      @orders = Order.where(user: @user)
    end

    def show
    end

    def new
      @order = Order.new
    end

    def edit
    end

    def create
      @order.cart = @cart

      respond_to do |format|
        if @order.save
          session.delete(:cart_id)
          format.html { redirect_to root_path, notice: "Commande validée" }

        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      end
    end





    def new

    end

    def create
      # Amount in cents
      @amount = 500

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Paiement template',
        :currency    => 'eur'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end




    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:theme, :price)
    end

    def redirect_if_cart_is_empty
      if @cart.cart_products.empty?
        redirect_to root_url, notice: "Votre panier est vide"
      end
    end
  end

end
