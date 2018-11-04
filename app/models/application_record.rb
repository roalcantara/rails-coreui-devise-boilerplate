# frozen_string_literal: true

require 'csv'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.to_csv(records = [], attributes = column_names)
    CSV.generate(headers: true) do |csv|
      csv << attributes

      records.each do |record|
        csv << attributes.map { |attr| record.send(attr) }
      end
    end
  end

  def self.human_enum_values_to_h(enum)
    Hash[send(enum.to_s.pluralize).map { |key, _| [key, human_enum_value(enum, key)] }]
  end

  def self.human_enum_values_to_a(enum)
    send(enum.to_s.pluralize).to_a.map { |w| [human_enum_value(enum, w[0]), w[1]] }
  end

  def self.human_enum_value(enum, value)
    human_attribute_name("#{enum}.#{value}")
  end

  def human_enum_value(enum, value = send(enum))
    self.class.human_enum_value(enum, value) unless value.blank?
  end
end
