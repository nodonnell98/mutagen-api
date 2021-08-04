# frozen_string_literal: true

json.extract! character, :weapon_ids, :classification_ids, :id, :name, :description, :health, :dodge, :might, :strike, :speed, :flying_speed, :mutation_points, :created_at, :updated_at
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
  json.strength do
    json.athletics character.athletics
    json.intimidation character.intimidation_STR
    json.force character.force
  end
  json.discipline do
    json.acrobatics character.acrobatics
    json.precision character.precision
    json.stealth character.stealth
  end
  json.constitution do
    json.endurance character.endurance
    json.resistance character.resistance
  end
  json.intelligence do
    json.investigation character.investigation
    json.science character.science
    json.tech character.tech
  end
  json.sense do
    json.insight character.insight
    json.perception character.perception
  end
  json.charm do
    json.deception character.deception
    json.intimidation character.intimidation_CHA
    json.persuasion character.persuasion
  end
  json.weapons do
    json.melee character.melee
    json.short_range character.short_range
    json.medium_range character.medium_range
    json.long_range character.long_range
  end
end
