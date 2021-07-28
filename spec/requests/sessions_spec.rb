# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise/sessions', type: :request do
  let!(:user) { FactoryBot.create(:user, username: 'Username') }
  let!(:weapon) { FactoryBot.create(:weapon) }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'renders a JSON response with the new session, & accepts case-insensitive email' do
        post user_session_url, as: :json, params: { user: { email: user.email.upcase, password: 'SuperSecret123!' } }

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))

        expect(response.body).to include(user.email)
        expect(response.body).to include(user.username)
        expect(response.body).not_to include('SuperSecret123!')

        get api_v1_weapons_url, as: :json

        expect(response).to be_successful
        expect(response.body).to include(weapon.name)
      end
    end

    context 'with invalid parameters' do
      it 'does not create when password does not match' do
        post user_session_url,
             params: { user: { email: user.email, password: '-' } }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include('Email or password is invalid')

        # Forbid secure route
        get api_v1_weapons_url, as: :json

        expect(response).to be_unauthorized
        expect(response.body).to include('Not Authenticated')
      end

      it 'does not create when email is not found' do
        post user_session_url,
             params: { user: { email: 'fake@example.com', password: 'SuperSecret123!' } }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include('Email or password is invalid')

        # Forbid secure route
        get api_v1_weapons_url, as: :json

        expect(response).to be_unauthorized
        expect(response.body).to include('Not Authenticated')
      end

      it 'does not create when password is case-insensitive' do
        post user_session_url,
             params: { user: { email: user.email, password: 'SUPERSECRET123!' } }, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.body).to include('Email or password is invalid')

        # Forbid secure route
        get api_v1_weapons_url, as: :json

        expect(response).to be_unauthorized
        expect(response.body).to include('Not Authenticated')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'successfully creates and destroys a session' do
      post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))

      expect(response.body).to include(user.email)
      expect(response.body).to include(user.username)
      expect(response.body).not_to include('SuperSecret123!')

      get api_v1_weapons_url, as: :json

      expect(response).to be_successful
      expect(response.body).to include(weapon.name)

      delete destroy_user_session_url, as: :json

      expect(response).to have_http_status(:no_content)

      get api_v1_weapons_url, as: :json

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end
  end
end
