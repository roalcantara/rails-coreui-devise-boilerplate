# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :component do
    function { %i[energy_givin bodybuilding protective].sample }
    kind { %i[macronutrient micronutrient].sample }
    group { %i[carbohydrate protein lipid vitamin mineral].sample }
    category { %i[water_soluble fat_soluble sugar starch cellulose saturated unsaturated].sample }
    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    after :build do |instance|
      instance.created_by = User.current_user || create(:user)
      instance.updated_by = instance.created_by
    end
  end
end
