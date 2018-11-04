# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :trait do
    kind { %i[positive negative].sample }
    title { FFaker::Name.name }

    after :build do |instance|
      instance.created_by = User.current_user || create(:user)
      instance.updated_by = instance.created_by
    end
  end
end
