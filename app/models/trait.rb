# frozen_string_literal: true

class Trait < ApplicationRecord
  include Blamable

  enum kind: { positive: 0, negative: 1 }

  validates :kind, presence: true, inclusion: { in: kinds.keys }
  validates :title, presence: true, length: { in: 5..100 }, uniqueness: true
end
