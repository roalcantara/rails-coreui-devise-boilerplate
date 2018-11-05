# frozen_string_literal: true

class FoodGroup < ApplicationRecord
  include Blamable

  validates :name, presence: true, length: { in: 5..100 }, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 500 }
end