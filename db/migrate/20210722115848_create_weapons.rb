# frozen_string_literal: true

class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :weapon_type
      t.string :description
      t.integer :range
      t.string :quality
      t.integer :dice_type
      t.integer :dice_qty
      t.integer :proficiency
      t.integer :ammo
      t.string :damage_type

      t.timestamps
    end
  end
end
