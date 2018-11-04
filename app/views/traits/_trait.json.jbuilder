# frozen_string_literal: true

json.extract! trait, :id, :title, :kind, :created_at, :updated_at
json.url trait_url(trait, format: :json)
