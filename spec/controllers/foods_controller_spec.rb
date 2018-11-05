# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsController do
  before :all do
    @current_user = create :user
  end

  before do
    sign_in @current_user
  end

  after do
    sign_out :user
  end

  let(:valid_attributes) { attributes_for :food, created_by: @current_user, food_group: create(:food_group) }
  let(:invalid_attributes) { valid_attributes.merge name: nil }

  describe 'GET #index' do
    before do
      Food.create! valid_attributes
    end

    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      food = Food.create! valid_attributes
      get :show, params: { id: food.to_param }
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
      food = Food.create! valid_attributes
      get :edit, params: { id: food.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Food' do
        expect do
          post :create, params: { food: valid_attributes }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the food list' do
        post :create, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new template)' do
        post :create, params: { food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :food }

      it 'updates the requested food' do
        food = Food.create! valid_attributes
        put :update, params: { id: food.to_param, food: new_attributes }
        food.reload
        expect(food.name).to eq new_attributes[:name]
      end

      it 'redirects to the food list' do
        food = Food.create! valid_attributes
        put :update, params: { id: food.to_param, food: valid_attributes }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit template)' do
        food = Food.create! valid_attributes
        put :update, params: { id: food.to_param, food: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food = Food.create! valid_attributes
      expect do
        delete :destroy, params: { id: food.to_param }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods list' do
      food = Food.create! valid_attributes
      delete :destroy, params: { id: food.to_param }
      expect(response).to redirect_to(foods_url)
    end
  end
end