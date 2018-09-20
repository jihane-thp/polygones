module Admin

  class ApplicationController < ::ApplicationController

    layout 'admin'

    before_action :set_current_site
    before_action :only_admin

  private
    def only_admin
      if !user_signed_in? || !current_user.admin? || current_user != Site.find_by(url: params['site']).user
        redirect_to handler_error_path, danger: "Vous ne pouvez pas accéder à ceci."
      end
    end

   def set_current_site
       @site = Site.find_by(user: current_user)
       @menu = Menu.find_by(site: @site)
       @user = current_user
   end

  end
end
