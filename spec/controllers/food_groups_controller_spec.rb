# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodGroupsController do
  before :all do
    @current_user = create :user
  end

  before do
    sign_in @current_user
  end

  after do
    sign_out :user
  end

  let(:valid_attributes) { attributes_for :food_group, created_by: @current_user }
  let(:invalid_attributes) { valid_attributes.merge(name: nil) }

  describe 'GET #index' do
    before do
      FoodGroup.create! valid_attributes
    end

    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      food_group = FoodGroup.create! valid_attributes
      get :show, params: { id: food_group.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      food_group = FoodGroup.create! valid_attributes
      get :edit, params: { id: food_group.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new FoodGroup' do
        expect do
          post :create, params: { food_group: valid_attributes }
        end.to change(FoodGroup, :count).by(1)
      end

      it 'redirects to the food_group list' do
        post :create, params: { food_group: valid_attributes }
        expect(response).to redirect_to(food_groups_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { food_group: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :component }

      it 'updates the requested food_group' do
        food_group = FoodGroup.create! valid_attributes
        put :update, params: { id: food_group.to_param, food_group: new_attributes }
        food_group.reload
        expect(food_group.name).to eq new_attributes[:name]
      end

      it 'redirects to the food_group list' do
        food_group = FoodGroup.create! valid_attributes
        put :update, params: { id: food_group.to_param, food_group: valid_attributes }
        expect(response).to redirect_to(food_groups_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        food_group = FoodGroup.create! valid_attributes
        put :update, params: { id: food_group.to_param, food_group: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food_group' do
      food_group = FoodGroup.create! valid_attributes
      expect do
        delete :destroy, params: { id: food_group.to_param }
      end.to change(FoodGroup, :count).by(-1)
    end

    it 'redirects to the food_groups list' do
      food_group = FoodGroup.create! valid_attributes
      delete :destroy, params: { id: food_group.to_param }
      expect(response).to redirect_to(food_groups_url)
    end
  end
end