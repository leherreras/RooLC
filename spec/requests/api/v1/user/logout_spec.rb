# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DELETE api/v1/users/sign_out', type: :request do
  describe 'DELETE session' do
    let(:user) { create(:user) }

    subject { delete destroy_user_session_path, headers: auth_headers, as: :json }
    context 'when user is not logged in' do
      it 'returns a successful response' do
        subject

        expect(response).to be_successful
      end

      it 'logout a user' do
        subject

        expect(json['errors']).to be_blank
        expect(response).to be_ok
        # user token should be deleted following sign out
        expect(user.reload.tokens.count).to eq 0
      end
    end

    context 'when user is not logged in' do
      let(:auth_headers) { nil }

      it 'does not return a successful response' do
        subject
        expect(response).to be_not_found
      end

      it 'does have empty session keys' do
        subject
        expect(user.reload.tokens).to be_empty
      end
    end
  end
end
