# frozen_string_literal: true

module ApplicationHelper
  def app_name
    Rails.application.class.to_s.split('::').first
  end
end
