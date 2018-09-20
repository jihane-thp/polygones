module Superadmin
  class DashboardController < Superadmin::ApplicationController
    def index
      @nb_user = User.all.count - 1
      @nb_site = Site.all.count
      @nb_article = Article.all.count
    end
  end
end
