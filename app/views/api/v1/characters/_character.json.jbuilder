# frozen_string_literal: true

json.extract! character, :weapon_ids, :classification_ids, :id, :name, :description, :favourite, :health, :dodge, :might, :strike, :speed, :flying_speed, :mutation_points, :created_at, :updated_at
json.traits do
  json.strength character.strength
  json.discipline character.discipline
  json.constitution character.constitution
  json.intelligence character.intelligence
  json.sense character.sense
  json.will character.will
  json.charm character.charm
end
json.skills do
  json.acrobatics character.acrobatics
  json.athletics character.athletics
  json.deception character.deception
  json.endurance character.endurance
  json.force character.force
  json.insight character.insight
  json.intimidation character.intimidation_STR
  json.intimidation character.intimidation_CHA
  json.investigation character.investigation
  json.perception character.perception
  json.persuasion character.persuasion
  json.precision character.precision
  json.resistance character.resistance
  json.science character.science
  json.stealth character.stealth
  json.tech character.tech
  json.melee character.melee
  json.short_range character.short_range
  json.medium_range character.medium_range
  json.long_range character.long_range
end
