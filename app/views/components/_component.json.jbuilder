# frozen_string_literal: true

json.extract! component, :id, :function, :kind, :group, :category, :name, :description, :created_at, :updated_at
json.url component_url(component, format: :json)
