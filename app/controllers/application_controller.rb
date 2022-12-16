class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb (new)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :name, :is_ngo, :location])

    # For additional in app/views/devise/registrations/edit.html.erb (new)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def default_url_options
    { host: ENV["www.supportyourngo.org"] || "localhost:3000" }
  end
end
