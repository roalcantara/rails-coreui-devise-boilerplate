# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodGroupsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/food_groups').to route_to('food_groups#index')
    end

    it 'routes to #new' do
      expect(get: '/food_groups/new').to route_to('food_groups#new')
    end

    it 'routes to #show' do
      expect(get: '/food_groups/1').to route_to('food_groups#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/food_groups/1/edit').to route_to('food_groups#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/food_groups').to route_to('food_groups#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/food_groups/1').to route_to('food_groups#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/food_groups/1').to route_to('food_groups#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/food_groups/1').to route_to('food_groups#destroy', id: '1')
    end
  end
end
