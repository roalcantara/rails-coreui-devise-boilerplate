# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most 100 }

  it { is_expected.to_not validate_presence_of :description }
  it { is_expected.to validate_length_of(:description).is_at_most 500 }

  it { is_expected.to belong_to :food_group }
end