module Superadmin

 class UsersController < Superadmin::ApplicationController

   before_action :set_superadmin_user, only: [:show, :edit, :update, :destroy]

   def index
     @users = User.all
   end

   def destroy
     @user.destroy
     respond_to do |format|
       format.html { redirect_to superadmin_users_url, notice: 'User was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_superadmin_user
       @user = User.find(params[:id])
     end



end

end
