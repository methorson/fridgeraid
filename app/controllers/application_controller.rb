class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email photo password])
  end

  def after_sign_in_path_for(resource)
    fridge_list_path(:id)
  end

end
