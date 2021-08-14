# frozen_string_literal: true

class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user, foreign_key: true

      # Descriptors
      t.string :name
      t.string :description

      # Traits
      t.integer :strength, default: 20
      t.integer :constitution, default: 20
      t.integer :discipline, default: 20
      t.integer :intelligence, default: 20
      t.integer :sense, default: 20
      t.integer :will, default: 20
      t.integer :charm, default: 20

      # Movement
      t.integer :speed, default: 1
      t.integer :flying_speed, default: 0

      # Combat stats
      t.integer :health
      t.integer :dodge
      t.integer :might
      t.integer :strike

      # Skills
      t.integer :athletics, default: 0
      t.integer :intimidation_STR, default: 0
      t.integer :force, default: 0
      t.integer :acrobatics, default: 0
      t.integer :precision, default: 0
      t.integer :stealth, default: 0
      t.integer :endurance, default: 0
      t.integer :resistance, default: 0
      t.integer :tech, default: 0
      t.integer :science, default: 0
      t.integer :investigation, default: 0
      t.integer :perception, default: 0
      t.integer :insight, default: 0
      t.integer :persuasion, default: 0
      t.integer :deception, default: 0
      t.integer :intimidation_CHA, default: 0
      t.integer :melee, default: 0
      t.integer :short_range, default: 0
      t.integer :medium_range, default: 0
      t.integer :long_range, default: 0

      # Progression
      t.integer :mutation_points, default: 0

      t.timestamps
    end
  end
end
