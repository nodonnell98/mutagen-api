# frozen_string_literal: true

json.array! @classifications, partial: 'api/v1/classifications/classification', as: :classification
