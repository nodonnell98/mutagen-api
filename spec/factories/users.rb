# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-email-#{n}@example.com" }
    password { 'SuperSecret123!' }
  end
end
