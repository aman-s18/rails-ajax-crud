class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.class.name == "User"
      "/users/#{current_user.id}"
    else
      root_path
    end
  end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile, :image])
    end
end
