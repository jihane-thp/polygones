module Admin

  class ArticlesController < Admin::ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article.where(site: @site)
    end

    def show
    end

    def new
      @article = Article.new
      @category = Category.new
    end

    def edit
    end

    def create

      @article          = Article.new(article_params)
      @article.user     = @user
      @article.site     = @site

      respond_to do |format|
        if @article.save
          format.html { redirect_to admin_articles_path }
        else
          format.html { render :new }
        end
      end
    end

    def update

      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to admin_articles_path }
        else
          format.html { render :edit }
        end
      end
    end


    def destroy
      @article.destroy
      respond_to do |format|
        format.html { redirect_to admin_articles_path }
      end
    end

    private
      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.fetch(:article, {})
        params.require(:article).permit(:title, :content, :slug, :site_id, :user_id, :id_article, :image, :category_id)
      end
  end

end
