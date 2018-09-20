module Admin

	class CategoriesController < Admin::ApplicationController

		before_action :set_category, only: [:show, :edit, :update, :destroy]

		include SlugHelper

		def index
			@categories = Category.where(site: @site)
			@category   = Category.new
		end

		def new
			@category = Category.new
		end

		def show
		end

		def create
			@category      = Category.new(category_params)
			@category.site = @site

			respond_to do |format|
				if @category.save
					format.html { redirect_to admin_categories_path }
					format.js
				else
					@error = "Cette adresse contient des caractères interdits ou est déjà assignée à une autre catégorie."
					format.html { render :index }
					format.js {render "admin/categories/error"}
				end
			end
		end

		def update
			respond_to do |format|
				if @category.update(category_params)
					format.html { redirect_to admin_categories_path }
				else
					format.html { render :edit }
				end
			end
		end

		def destroy
			@category.destroy
			respond_to do |format|
				format.html { redirect_to admin_categories_path }
			end
		end

		private

		def category_params
			params.require(:category).permit(:title,:slug)
		end

		def set_category
			@category = Category.find(params[:id])
		end
	end

end
