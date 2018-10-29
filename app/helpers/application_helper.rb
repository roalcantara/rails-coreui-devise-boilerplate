# frozen_string_literal: true

module ApplicationHelper
  def app_name
    Rails.application.class.to_s.split('::').first
  end

  def page_title
    content_for(:page_title) ||
      [app_name, controller.controller_name.capitalize, controller.action_name.capitalize].join(' | ')
  end
end
