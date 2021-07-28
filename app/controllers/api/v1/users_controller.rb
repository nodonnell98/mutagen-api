# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def update
        if current_user.update(user_params)
          render :show, status: :ok
        else
          render json: current_user.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
  end
end

