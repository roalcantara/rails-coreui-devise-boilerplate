# frozen_string_literal: true

module Blamable
  extend ActiveSupport::Concern

  included do
    belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
    belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by_id', optional: true

    before_validation(on: :create) do
      self.created_by = User.current_user if created_by.nil?
    end

    before_validation(on: :update) do
      self.created_by = User.find(created_by_id) if created_by.nil?
      self.updated_by = User.current_user
    end

    validates :created_by, presence: true, on: :create
    validates :updated_by, presence: true, on: :update

    scope :created_by, ->(user) { where(created_by_id: user.id) }
    scope :updated_by, ->(user) { where(updated_by_id: user.id) }

    delegate :email, to: :created_by, prefix: true
    delegate :email, to: :updated_by, prefix: true
  end
end
