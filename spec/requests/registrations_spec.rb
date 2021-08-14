# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise/registrations', type: :request do
  let!(:existing_user) { FactoryBot.create(:user) }

  let!(:valid_attributes) { FactoryBot.attributes_for(:user, username: 'Username') }
  let!(:invalid_attributes) { FactoryBot.attributes_for(:user, email: 'Invalid', password: nil) }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'is permitted when not signed in' do
        expect do
          post user_registration_url, as: :json, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post user_registration_url, as: :json, params: { user: valid_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))

        expect(response.body).not_to include(existing_user.email)
        expect(response.body).to include(valid_attributes[:email])
        expect(response.body).to include(valid_attributes[:username])
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        expect do
          post user_registration_url,
               params: invalid_attributes, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post user_registration_url,
             params: { user: invalid_attributes }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')

        expect(response.body).to include('Email is invalid')
        expect(response.body).to include('Password can\'t be blank')
      end
    end
  end
end
