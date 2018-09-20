module Superadmin
  class ApplicationController < ::ApplicationController
    layout 'superadmin'

    before_action :only_superadmin

  private
    def only_superadmin
      if !user_signed_in? || !current_user.superadmin?
        redirect_to handler_error_path, danger: "Vous ne pouvez pas accéder à ceci. "
      end

    end

  end
end
