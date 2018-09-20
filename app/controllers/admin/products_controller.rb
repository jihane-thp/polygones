module Admin
  class Admin::ProductsController < Admin::ApplicationController

    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index

      all_products = Product.all
      @products = []

      for p in all_products
        if Template.exists?(site: @site, product: p )
        else
          @products << p
        end
      end
      
        if(@user.cart.nil?)
          @cart = Cart.create
          @user.update(cart: @cart)
      else
            @cart = @user.cart
      end
    end

    def show
    end

    def new
      @product = Product.new
    end

    def edit
      respond_to do |format|
        if @product.edit(product_params)
          format.html { redirect_to @product, notice: 'Produit édité.' }
          format.js
        else
          format.html { render :edit }
        end
      end
    end

    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.html { redirect_to @product }
          format.js
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product }
          format.js
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url }
      end
    end

    private
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :price)
    end

  end

end
