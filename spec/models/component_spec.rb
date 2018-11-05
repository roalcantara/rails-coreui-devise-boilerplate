# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Component do
  it { is_expected.to validate_presence_of :function }
  it { is_expected.to define_enum_for(:function).with_values(%i[energy_givin bodybuilding protective]) }

  it { is_expected.to validate_presence_of :kind }
  it { is_expected.to define_enum_for(:kind).with_values(%i[macronutrient micronutrient]) }

  it { is_expected.to validate_presence_of :group }
  it { is_expected.to define_enum_for(:group).with_values(%i[carbohydrate protein lipid vitamin mineral]) }

  it { is_expected.to_not validate_presence_of :category }
  it do
    is_expected.to define_enum_for(:category)
      .with_values(%i[water_soluble fat_soluble sugar starch cellulose saturated unsaturated])
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(100) }

  it { is_expected.to_not validate_presence_of :description }
  it { is_expected.to validate_length_of(:description).is_at_most(1000) }
end
