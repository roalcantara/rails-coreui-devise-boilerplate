# frozen_string_literal: true

module BreadcrumbHelper
  def breadcrumbs
    render partial: '/layouts/breadcrumb', locals: { crumbs: (@crumbs || ['Home']) }
  end

  def crumb(item, last = false)
    if item.is_a?(String)
      item
    elsif last
      item[:name]
    else
      link_to item[:name], item[:url]
    end
  end

  def current_crumb?(item)
    item.key?('current') && item.current? unless item.is_a?(String)
  end
end
