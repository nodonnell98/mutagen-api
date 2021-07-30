# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Weapons', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:weapon) { FactoryBot.create(:weapon) }

  describe 'GET /index' do
    it 'will not succeed if not signed in' do
      get '/api/v1/weapons', as: :json

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end

    context 'when signed in' do
      before do
        post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }
      end

      it 'correctly gets request' do
        get '/api/v1/weapons', as: :json

        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    it 'will not succeed if not signed in' do
      get "/api/v1/weapons/#{weapon.id}", as: :json

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end

    context 'when signed in' do
      before do
        post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }
      end

      it 'correctly gets request for individual weapon' do
        get "/api/v1/weapons/#{weapon.id}", as: :json

        expect(response).to be_successful
        expect(response.body).to include(weapon.name)
      end
    end
  end

  describe 'POST /create' do
    it 'will not succeed if not signed in' do
      post '/api/v1/weapons', params: {
        weapon: {
          name: 'Widowmaker',
          weapon_type: 'Sniper',
          description: 'A deadly sniper',
          range: 200,
          quality: 'rare',
          dice_type: 4,
          dice_qty: 2,
          proficiency: 2,
          ammo: 3,
          damage_type: 'kinetic'
        }
      }

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end

    context 'when signed in' do
      before do
        post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }
      end

      it 'is successful with valid params' do
        post '/api/v1/weapons', params: {
          weapon: {
            name: 'Widowmaker',
            weapon_type: 'Sniper',
            description: 'A deadly sniper',
            range: 200,
            quality: 'rare',
            dice_type: 4,
            dice_qty: 2,
            proficiency: 2,
            ammo: 3,
            damage_type: 'kinetic'
          }
        }

        expect(response.status).to eq(201)
        expect(Weapon.count).to eq(2)
        expect(Weapon.last.name).to eq('Widowmaker')
      end

      it 'is unsuccessful with invalid params' do
        post '/api/v1/weapons', params: {
          weapon: {
            name: 24,
            weapon_type: nil,
            description: 'A deadly sniper',
            range: 200,
            quality: 'rare',
            dice_type: 4,
            dice_qty: nil,
            proficiency: 2,
            ammo: 3,
            damage_type: 'kinetic'
          }
        }

        expect(response.status).to eq(422)
        expect(Weapon.count).to eq(1)
        expect(Weapon.last.name).to_not eq('Widowmaker')
      end
    end
  end

  describe 'PUT /update' do
    it 'will not succeed if not signed in' do
      put "/api/v1/weapons/#{weapon.id}", params: {
        weapon: {
          name: 'Edited Gun'
        }
      }

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end

    context 'when signed in' do
      before do
        post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }
      end

      it 'successfully edits weapon with valid changes' do
        weapon_url = "/api/v1/weapons/#{weapon.id}"

        expect(Weapon.count).to eq(1)
        expect(Weapon.last.name).to eq('Gun')

        put weapon_url, params: {
          weapon: {
            name: 'Edited Gun'
          }
        }

        expect(response.status).to eq(200)
        expect(Weapon.count).to eq(1)
        expect(Weapon.last.name).to eq('Edited Gun')
      end

      it 'will not edit weapon with invalid changes' do
        weapon_url = "/api/v1/weapons/#{weapon.id}"

        expect(Weapon.count).to eq(1)
        expect(Weapon.last.name).to eq('Gun')

        put weapon_url, params: {
          weapon: {
            name: nil
          }
        }

        expect(response.status).to eq(422)
        expect(Weapon.last.name).to eq('Gun')
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:weapon2) { FactoryBot.create(:weapon, name: 'DeleteMe') }

    it 'will not succeed if not signed in' do
      delete "/api/v1/weapons/#{weapon2.id}", as: :json

      expect(response).to be_unauthorized
      expect(response.body).to include('Not Authenticated')
    end

    context 'when signed in' do
      before do
        post user_session_url, as: :json, params: { user: { email: user.email, password: 'SuperSecret123!' } }
      end

      it 'deletes a present record' do
        expect(Weapon.last.name).to eq('DeleteMe')
        expect(Weapon.count).to eq(2)

        weapon_url = "/api/v1/weapons/#{weapon2.id}"
        delete weapon_url, as: :json

        expect(response.status).to eq(204)
        expect(Weapon.count).to eq(1)
      end
    end
  end
end
