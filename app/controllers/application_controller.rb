class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  before_action :store_last_location

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :remove_photo])
  end

  def after_sign_in_path_for(resource)
    session[:previous_page] || stored_location_for(resource) || root_path
  end

  private

  def store_last_location
    # Ignora a página de login e senha esquecida
    unless request.fullpath =~ /\/users\/sign_in/ || request.fullpath =~ /\/users\/password/
      session[:previous_page] = request.fullpath
    end
  end

end
