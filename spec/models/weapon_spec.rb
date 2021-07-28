# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weapon, type: :model do
  let!(:weapon) { FactoryBot.build(:weapon) }

  it 'is valid with valid attributes' do
    expect(weapon).to have(0).errors_on(:name)
    expect(weapon).to be_valid
  end

  it 'is not valid without a valid name' do
    weapon.name = nil

    expect(weapon).to have(1).errors_on(:name)
    expect(weapon).to_not be_valid
  end
end
