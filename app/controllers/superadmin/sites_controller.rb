module Superadmin

 class SitesController < Superadmin::ApplicationController

   before_action :set_superadmin_site, only: [:show, :edit, :update, :destroy]

   def index
     @sites = Site.all
   end

   def destroy
     @site.destroy
     respond_to do |format|
       format.html { redirect_to superadmin_sites_url, notice: 'Site was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_superadmin_site
       @site = Site.find(params[:id])
     end



end

end
