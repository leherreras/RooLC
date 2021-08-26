# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Confirmation', type: :request do
  subject { get user_confirmation_path, params: params, as: :json }

  let(:user) { create(:user, confirmed_at: nil) }
  let(:confirmation_token) { user.confirmation_token }

  let(:params) do
    {
      confirmation_token: confirmation_token
    }
  end

  context 'when token is valid' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
      expect(json[:account_confirmation_success]).to eq(true)
    end

    it 'confirms the user email' do
      subject

      expect(user.reload.confirmed?).to be true
    end
  end

  context 'when token is not valid' do
    let(:confirmation_token) { 'invalid_token' }

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:not_found)
      expect(json[:message]).to eq("Couldn't find the record")
    end

    it 'does not confirms the user email' do
      subject

      expect(user.reload.confirmed?).to be false
    end
  end
end
