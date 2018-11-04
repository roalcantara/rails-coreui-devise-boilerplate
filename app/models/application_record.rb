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
end
