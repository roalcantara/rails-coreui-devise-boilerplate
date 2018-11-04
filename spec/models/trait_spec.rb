# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trait do
  it { is_expected.to validate_presence_of :kind }
  it { is_expected.to define_enum_for(:kind).with_values(%i[positive negative]) }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_length_of(:title).is_at_least(5).is_at_most(100) }
end
