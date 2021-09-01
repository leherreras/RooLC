# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/targets', type: :request do
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET /show' do
    it 'renders a successful response' do
      target = Target.create! valid_attributes
      get target_url(target)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Target' do
        expect {
          post api_v1_targets_url, params: { target: valid_attributes }
        }.to change(Target, :count).by(1)
      end

      it 'redirects to the created target' do
        post api_v1_targets_url, params: { target: valid_attributes }
        expect(response).to redirect_to(api_v1_target_url(Target.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Target' do
        expect {
          post api_v1_targets_url, params: { target: invalid_attributes }
        }.to change(Target, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post api_v1_targets_url, params: { target: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested target' do
        target = Target.create! valid_attributes
        patch api_v1_target_url(target), params: { target: new_attributes }
        target.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the target' do
        target = Target.create! valid_attributes
        patch api_v1_target_url(target), params: { target: new_attributes }
        target.reload
        expect(response).to redirect_to(api_v1_target_url(target))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        target = Target.create! valid_attributes
        patch api_v1_target_url(target), params: { target: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested target' do
      target = Target.create! valid_attributes
      expect {
        delete api_v1_target_url(target)
      }.to change(Target, :count).by(-1)
    end

    it 'redirects to the targets list' do
      target = Target.create! valid_attributes
      delete api_v1_target_url(target)
      expect(response).to redirect_to(api_v1_targets_url)
    end
  end
end
