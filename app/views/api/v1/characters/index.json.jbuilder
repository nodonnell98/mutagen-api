# frozen_string_literal: true

json.array! @characters, partial: 'api/v1/characters/character', as: :character
