class HandlerController < ApplicationController

  layout 'nature'

  def new_comment
    @comment = Comment.new(commentaire_params)
    @comment.article = Article.find(params['comment']['article'])

    @site = Site.find_by(url: params[:site])

    if @comment.save
         respond_to do |format|
            format.html { redirect_to root_path }
            format.js  { render "web/"+@site.template.slug+"/comment.js.erb"}
         end
    end

  end

  def commentaire_params
    params.require(:comment).permit(:name, :content)
  end

  def web

    @comment = Comment.new
    @comments = []

    @site = Site.find_by(url: params[:site])

    if(! @site )
      redirect_to handler_error_path
    else

    @tabs = @site.tabs

    if !params[:slug1]
      # page d'accueil du site

      if Tab.find_by(home: true, site: @site).item.instance_of? Article
        @article = Tab.find_by(home: true, site: @site).item
        hit = @article.hits + 1
        @article.update(hits: hit)
        render "web/#{@site.template.slug}/article"

      else
        @articles = Article.where(category: Tab.find_by(home: true, site: @site).item, site:  @site)
        render "web/#{@site.template.slug}/blog"

      end

      # todo
      # Attention il est posible que la page d'accueil soit une page categorie
    else
      #params[:slug1] existe

      if params[:slug2]
        # page article

        @article = @site.articles.find_by(slug: params[:slug2])
        if ! @article
          # article n'existe pas
          # faudrai le retourner a la page interne du template
          render handler_404_path
        else
          #render :index
          hit = @article.hits + 1
          @article.update(hits: hit)
          @comments = Comment.where(article: @article)

          render "web/#{@site.template.slug}/article"
        end

      else
        # page article ou categorie
        @article = @site.articles.find_by(slug: params[:slug1])
        if @article
          hit = @article.hits + 1
          @article.update(hits: hit)
          @comments = Comment.where(article: @article)
          render "web/#{@site.template.slug}/article"
        else


          @category = Category.find_by(slug: params[:slug1], site: @site)

          if @category
              @articles = @site.articles.where(category: @category)
              puts @articles

            render "web/#{@site.template.slug}/blog"
          else
            render handler_error_path
          end
        end
      end

    end


  end


  end


  def index
  	@products = Product.order(:title)
  end

  def error
  end

  def comming_soon
  end

  def inscription
  end

  def search

    site_name = params['q']

    @site_name = site_name


    if Site.exists?(url: site_name)
      @message_site_erreur = true
    else
      @message_site_valide = true
    end
    respond_to do |f|
      f.js
    end

  end

end
