class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters, only: [:create]

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email,
           :first_name, :last_name, :cell_phone, :dob, :password, :password_confirmation,
           address_attributes: [:line1, :line2, :city, :state, :zip]) }
    end

end
