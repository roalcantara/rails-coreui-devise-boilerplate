# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComponentsController do
  before :all do
    @current_user = create :user
  end

  before do
    sign_in @current_user
  end

  after do
    sign_out :user
  end

  let(:valid_attributes) { attributes_for :component, created_by: @current_user }
  let(:invalid_attributes) { valid_attributes.merge(name: nil) }

  describe 'GET #index' do
    before do
      Component.create! valid_attributes
    end

    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      component = Component.create! valid_attributes
      get :show, params: { id: component.to_param }
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
      component = Component.create! valid_attributes
      get :edit, params: { id: component.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Component' do
        expect do
          post :create, params: { component: valid_attributes }
        end.to change(Component, :count).by(1)
      end

      it 'redirects to the component list' do
        post :create, params: { component: valid_attributes }
        expect(response).to redirect_to(components_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { component: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :component }

      it 'updates the requested component' do
        component = Component.create! valid_attributes
        put :update, params: { id: component.to_param, component: new_attributes }
        component.reload
        expect(component.name).to eq new_attributes[:name]
      end

      it 'redirects to the component list' do
        component = Component.create! valid_attributes
        put :update, params: { id: component.to_param, component: valid_attributes }
        expect(response).to redirect_to(components_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        component = Component.create! valid_attributes
        put :update, params: { id: component.to_param, component: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested component' do
      component = Component.create! valid_attributes
      expect do
        delete :destroy, params: { id: component.to_param }
      end.to change(Component, :count).by(-1)
    end

    it 'redirects to the components list' do
      component = Component.create! valid_attributes
      delete :destroy, params: { id: component.to_param }
      expect(response).to redirect_to(components_url)
    end
  end
end
