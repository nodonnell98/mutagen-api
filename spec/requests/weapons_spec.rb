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
    it 'valid bookmark attributes' do
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
  end

  describe "" do
  end

  describe "" do
  end

  describe "" do
  end
end
