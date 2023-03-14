class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authenticate_artist!


  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_update :redirect_after_update, if: :devise_controller?, only: [:update]

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :location, :bio, :pronouns])
  end

  # def redirect_after_update
  #   redirect_to(artists_path) and return
  # end
end
