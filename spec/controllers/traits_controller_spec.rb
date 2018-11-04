# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TraitsController do
  before :all do
    @current_user = create :user
  end

  before do
    sign_in @current_user
  end

  after do
    sign_out :user
  end

  let(:valid_attributes) { attributes_for :trait, created_by: @current_user }
  let(:invalid_attributes) { valid_attributes.merge(title: nil) }

  describe 'GET #index' do
    before do
      Trait.create! valid_attributes
    end

    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      trait = Trait.create! valid_attributes
      get :show, params: { id: trait.to_param }
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
      trait = Trait.create! valid_attributes
      get :edit, params: { id: trait.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Trait' do
        expect do
          post :create, params: { trait: valid_attributes }
        end.to change(Trait, :count).by(1)
      end

      it 'redirects to the trait list' do
        post :create, params: { trait: valid_attributes }
        expect(response).to redirect_to(traits_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { trait: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :trait }

      it 'updates the requested trait' do
        trait = Trait.create! valid_attributes
        put :update, params: { id: trait.to_param, trait: new_attributes }
        trait.reload
        expect(trait.title).to eq new_attributes[:title]
      end

      it 'redirects to trait list' do
        trait = Trait.create! valid_attributes
        put :update, params: { id: trait.to_param, trait: new_attributes }
        expect(response).to redirect_to(traits_path)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        trait = Trait.create! valid_attributes
        put :update, params: { id: trait.to_param, trait: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested trait' do
      trait = Trait.create! valid_attributes
      expect do
        delete :destroy, params: { id: trait.to_param }
      end.to change(Trait, :count).by(-1)
    end

    it 'redirects to the traits list' do
      trait = Trait.create! valid_attributes
      delete :destroy, params: { id: trait.to_param }
      expect(response).to redirect_to(traits_url)
    end
  end
end
