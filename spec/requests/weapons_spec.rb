require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  let!(:weapon) { FactoryBot.create(:weapon)}

  describe "GET /index" do
    it 'correctly gets request' do
      get weapons_url(), as: :json

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'is successful with valid params' do
      # send a POST request to /weapon, with these parameters
      # The controller will treat them as JSON
      post '/weapons', params: {
        weapon: {
          name: "Widowmaker",
          weapon_type: "Sniper",
          description: "A deadly sniper",
          range: 200,
          quality: "rare",
          dice_type: 4,
          dice_qty: 2,
          proficiency: 2,
          ammo: 3,
          damage_type: "kinetic"
        }
      }

      expect(response.status).to eq(201)
      expect(Weapon.count).to eq(2)
      expect(Weapon.last.name).to eq('Widowmaker')
    end

    it 'is unsuccessful with invalid params' do
      # send a POST request to /weapon, with these parameters
      # The controller will treat them as JSON
      post '/weapons', params: {
        weapon: {
          name: 24,
          weapon_type: nil,
          description: "A deadly sniper",
          range: 200,
          quality: "rare",
          dice_type: 4,
          dice_qty: nil,
          proficiency: 2,
          ammo: 3,
          damage_type: "kinetic"
        }
      }

      expect(response.status).to eq(422)
      expect(Weapon.count).to eq(1)
      expect(Weapon.last.name).to_not eq('Widowmaker')
    end
  end

  describe "PUT /update" do
    it 'successfully edits weapon with valid changes' do
      weapon_url = '/weapons/' + weapon.id.to_s

      expect(Weapon.count).to eq(1)
      expect(Weapon.last.name).to eq('Gun')

      put weapon_url,  params: {
        weapon: {
          name: "Edited Gun"
        }
      }

      expect(response.status).to eq(200)
      expect(Weapon.count).to eq(1)
      expect(Weapon.last.name).to eq('Edited Gun')
    end

    it 'will not edit weapon with invalid changes' do
      weapon_url = '/weapons/' + weapon.id.to_s

      expect(Weapon.count).to eq(1)
      expect(Weapon.last.name).to eq('Gun')

      put weapon_url,  params: {
        weapon: {
          name: nil
        }
      }

      expect(response.status).to eq(422)
      expect(Weapon.last.name).to eq('Gun')
    end
  end

  describe "DELETE /destroy" do
    let!(:weapon2) { FactoryBot.create(:weapon, name: 'DeleteMe')}
    it 'deletes a present record' do
      expect(Weapon.last.name).to eq('DeleteMe')
      expect(Weapon.count).to eq(2)

      weapon_url = '/weapons/' + weapon2.id.to_s
      delete weapon_url, as: :json

      expect(response.status).to eq(204)
      expect(Weapon.count).to eq(1)
    end
  end
end
