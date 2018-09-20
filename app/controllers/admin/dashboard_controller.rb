module Admin
  class Admin::DashboardController < Admin::ApplicationController

    def index
      @nb_articles     = Article.where(site: @site).count
      @nb_categories   = Category.where(site: @site).count
      @nb_commentaires = Comment.where(article: @user.articles.ids).count
      @articles        = Article.where(site: @site).all.order("created_at DESC").limit(5)
      @comments        = Comment.where(article: @user.articles.ids).order("created_at DESC").limit(5)
    end

    def error
    end
  end
end
