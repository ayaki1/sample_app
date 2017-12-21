class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
 
  private
 
      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
      end
 
      def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture, :current_password)
      end
end
