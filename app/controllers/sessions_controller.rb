# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :verify_signed_out_user, only: %i[destroy]

  def create
    user = User.find_for_authentication(email: sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      cookies.signed[:token] = {
        value: user.generate_jwt,
        httponly: true
      }

      @current_user = user
    else
      render json: { errors: 'Email or password is invalid' }, status: :unprocessable_entity
    end
  end

  def destroy
    cookies.delete(:token)
  end
end
