# frozen_string_literal: true

module ApplicationHelper
  def app_name
    Rails.application.class.to_s.split('::').first
  end

  def page_title
    content_for(:page_title) ||
      [app_name, controller.controller_name.capitalize, controller.action_name.capitalize].join(' | ')
  end

  def body_classes(classes)
    content_for(:body_classes) do
      classes
    end
  end

  def show_errors(model)
    render partial: '/layouts/errors', locals: { model: model }
  end
end
