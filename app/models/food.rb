# frozen_string_literal: true

class Food < ApplicationRecord
  include Blamable

  belongs_to :food_group

  validates :name, presence: true, length: { in: 5..100 }, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 500 }

  delegate :name, to: :food_group, prefix: true
end