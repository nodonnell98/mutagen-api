# frozen_string_literal: true

class Character < ApplicationRecord
  belongs_to :user
  has_many :character_weapons, dependent: :destroy
  has_many :weapons, through: :character_weapons

  validates :name, presence: true
end
