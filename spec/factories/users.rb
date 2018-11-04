# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    password_confirmation(&:password)
  end
end
