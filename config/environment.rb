# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# global blamer configuration
ActiveRecord::Base.created_userstamp_column = :created_by_id
ActiveRecord::Base.updated_userstamp_column = :updated_by_id
