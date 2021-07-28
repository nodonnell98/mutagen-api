# frozen_string_literal: true

json.array! @weapons, partial: 'api/weapons/weapon', as: :weapon
