# frozen_string_literal: true

json.extract! food_group, :id, :name, :description, :created_at, :updated_at
json.url food_group_url(food_group, format: :json)
