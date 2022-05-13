class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    helper_method :current_user

    def current_user
       if current_owner
          current_owner
       else
          current_tenant
       end   
     end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname,:middlename,:lastname, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:image,:firstname,:middlename,:lastname, :email, :password, :current_password)}
         end
end
