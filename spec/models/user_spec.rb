# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { FactoryBot.build(:user) }

    it 'is valid when params are correct' do
      expect(user).to have(0).errors_on(:email)
      expect(user).to have(0).errors_on(:password)
      expect(user).to have(0).errors_on(:password_confirmation)
      expect(user).to have(0).errors_on(:username)
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil

      expect(user).to have(1).errors_on(:email)
      expect(user).to have(0).errors_on(:password)
      expect(user).to have(0).errors_on(:password_confirmation)
      expect(user).to have(0).errors_on(:username)
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil

      expect(user).to have(1).errors_on(:password)
      expect(user).to have(0).errors_on(:email)
      expect(user).to have(0).errors_on(:password_confirmation)
      expect(user).to have(0).errors_on(:username)
      expect(user).not_to be_valid
    end

    it 'is not valid when password and password confirmation do not match' do
      user.password = 'Test Password'
      user.password_confirmation = 'Test Password 2'

      expect(user).to have(1).errors_on(:password_confirmation)
      expect(user).to have(0).errors_on(:email)
      expect(user).to have(0).errors_on(:password)
      expect(user).to have(0).errors_on(:username)
      expect(user).not_to be_valid
    end
  end
end
