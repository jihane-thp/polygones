# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

   include SitesHelper

   layout 'user'

   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   before_action :set_current_site, only: [:edit, :update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
      if Site.exists?(url: params[:site][:url])
        respond_to do |format|
            format.html { redirect_to new_user_registration_path, alert: 'L\'adresse du site existe déja, veuillez en saisir une autre.' }
        end
      else
        super
      end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
   #def destroy
  #   super
     #current_user.destroy
     #redirect_to root_path

  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

 protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:avatar, :nickname])
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:avatar, :nickname])
   end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
     #super(resource)
     if current_user
       build_site_for_user
     end
     admin_path(current_user.site.url)
  end

  def after_update_path_for(resource)
    if resource.is_a?(User)
      admin_path(current_user.site.url)
    else
      super
    end
  end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  def build_site_for_user
    #ditinguer nom et url
    create_site(params[:site][:url],params[:user][:site], current_user)
  end


  def set_current_site
      @site = Site.find_by(user: current_user)
      @menu = Menu.find_by(site: @site)
  end

end
