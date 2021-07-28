# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def authenticate_user
    unless cookies.signed[:token].present?
      render json: { errors: ['Not Authenticated'] },
             status: :unauthorized && return
    end

    token = cookies.signed[:token]
    jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base || ENV['SECRET_KEY_BASE']).first

    @current_user_id = jwt_payload['id']
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def authenticate_user!(_options = {})
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end
