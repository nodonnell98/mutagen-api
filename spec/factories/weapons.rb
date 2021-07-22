# frozen_string_literal: true

FactoryBot.define do
  factory :weapon do
    name { "Gun" }
    weapon_type { "Pistol" }
    description { "A gun" }
    range { 20 }
    quality { "common" }
    dice_type { 4 }
    dice_qty { 1 }
    proficiency { 4 }
    ammo { 6 }
    damage_type { "Kinetic" }
  end
end
