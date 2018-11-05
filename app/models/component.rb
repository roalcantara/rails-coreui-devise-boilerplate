# frozen_string_literal: true

class Component < ApplicationRecord
  include Blamable

  enum function: { energy_givin: 0, bodybuilding: 1, protective: 2 }
  enum kind: { macronutrient: 0, micronutrient: 1 }
  enum group: { carbohydrate: 0, protein: 1, lipid: 2, vitamin: 3, mineral: 4 }
  enum category: { water_soluble: 0, fat_soluble: 1, sugar: 2, starch: 3, cellulose: 4, saturated: 5, unsaturated: 6 }

  validates :function, presence: true, inclusion: { in: functions.keys }
  validates :kind, presence: true, inclusion: { in: kinds.keys }
  validates :group, presence: true, inclusion: { in: groups.keys }
  validates :category, presence: false, inclusion: { in: categories.keys }, allow_nil: true
  validates :name, presence: true, length: { in: 5..100 }, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 1000 }
end
