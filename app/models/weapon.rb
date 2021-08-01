# frozen_string_literal: true

class Weapon < ApplicationRecord
  has_many :character_weapons
  has_many :characters, through: :character_weapons

  validates :name, presence: true, uniqueness: true
  validates :weapon_type, presence: true
  validates :range, presence: true
  validates :quality, presence: true
  validates :description, presence: true
  validates :dice_type, presence: true
  validates :dice_qty, presence: true
  validates :proficiency, presence: true
  validates :ammo, presence: true
  validates :damage_type, presence: true
end
