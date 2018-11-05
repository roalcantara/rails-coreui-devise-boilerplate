# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :food do
    food_group
    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    after :build do |instance|
      instance.created_by = User.current_user || create(:user)
      instance.updated_by = instance.created_by
    end
  end
end
