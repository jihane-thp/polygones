module Admin

 class SitesController < Admin::ApplicationController

   def edit
   end

   def update_template
   end

  def update
    respond_to do |format|
      if @site.update(name: params['site']['name'], slogan: params['site']['slogan'],meta_description: params['site']['meta_description'],meta_title: params['site']['meta_title'],)
        format.html { redirect_to (admin_path @site.url), notice: 'Site was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      #conflit avec variable utilisée dans les routes
      #params.require(@site).permit(:name, :slogan, :meta_description, :meta_title, :user_id, :menu_id, :template_id)
    end

end

end
