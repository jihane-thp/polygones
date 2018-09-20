module Admin

  class PluginsController < Admin::ApplicationController

    before_action :set_plugin, only: [:show, :edit, :update, :destroy]

    def index
      @plugins = @user.site.plugins
    end

    def edit
    end

    def update
      respond_to do |format|
        if @plugin.update(plugin_params)
          format.html { redirect_to @plugin, notice: 'Plugin was successfully updated.' }
          format.json { render :show, status: :ok, location: @plugin }
        else
          format.html { render :edit }
          format.json { render json: @plugin.errors, status: :unprocessable_entity }
        end
      end
    end


    private
      def set_plugin
        @plugin = Plugin.find(params[:id])
      end

      def admin_params
        params.require(:admin_plugin).permit(:name, :is_activated, :site_id)
      end
  end

end
