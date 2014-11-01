class Society::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def sign_up
        default_params.permit(:email, :password,:password_confirmation, :name, :category, :descritpion )
    end
end