# frozen_string_literal: true

json.extract! character, :id, :created_at, :updated_at
json.url character_url(character, format: :json)
