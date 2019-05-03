# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:data) { JSON.parse(response.body, symbolize_names: true)[:data] }

  describe 'creating a user' do
    before { post :create, params: { user: user_params } }

    context 'with valid params' do
      let(:user_params) do
        user = attributes_for(:user)
        user[:orders_attributes] = [attributes_for(:order)]
        user
      end

      it 'user created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:user_params) { attributes_for(:user, identification_document: nil) }

      it 'user not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'updating a user' do
    before { patch :update, params: update_params }

    let(:user) { create(:user, :with_orders) }

    let(:update_params) do
      { id: user.id, user: user_params }
    end

    context 'when all params are valids' do
      let(:user_params) do
        attributes_for(:user, name: 'testing')
      end

      it 'user updated' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when any param is invalid' do
      let(:user_params) do
        attributes_for(:user, identification_document: nil)
      end

      it 'user not updated' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'listing users' do
    before do
      create(:user, :with_orders)
      create(:user, :with_orders, identification_document: '55555')
      get :index, params: params
    end

    context 'with a filter' do
      let(:params) do
        { q: { identification_document_cont: '55555' } }
      end

      it 'filtered users' do
        expect(data.size).to eq(1)
      end
    end

    context 'without a filter' do
      let(:params) {}

      it 'unfiltered users' do
        expect(data.size).to eq(2)
      end
    end
  end

  describe 'showing a user' do
    before { get :show, params: { id: user_id } }

    let(:user) { create(:user) }

    context 'with a valid user id' do
      let(:user_id) { user.id }

      it 'user displayed' do
        expect(data[:id]).to eq(user_id.to_s)
      end
    end

    context 'with a invalid user id' do
      let(:user_id) { 9999 }

      it 'user not displayed' do
        expect(data).to be_blank
      end
    end
  end

  describe 'destroying a user' do
    before { delete :destroy, params: { id: user_id } }

    context 'with a valid id' do
      let(:user_id) { create(:user).id }

      it 'user deleted' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with a invalid id' do
      let(:user_id) { 1212 }

      it 'user not deleted' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
