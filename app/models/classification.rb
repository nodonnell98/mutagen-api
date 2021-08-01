# frozen_string_literal: true

class Classification < ApplicationRecord
  has_many :character_classifications, dependent: :destroy
  has_many :characters, through: :character_classifications

  validates :name, presence: true
end
