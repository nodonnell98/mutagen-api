require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  let!(:weapon) { FactoryBot.create(:weapon)}

  describe "GET /index" do
    it 'correctly gets request' do
      get weapons_url(), as: :json

      expect(response).to be_successful
    end
  end
end
