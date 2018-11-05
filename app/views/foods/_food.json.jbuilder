# frozen_string_literal: true

json.extract! food, :id, :food_group_id, :name, :description, :created_at, :updated_at
json.url food_url(food, format: :json)