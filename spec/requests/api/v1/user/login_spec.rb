# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST api/v1/users/sign_in', type: :request do
  subject { post user_session_path, params: params, as: :json }

  describe 'POST create' do

    let(:token) do
      {
        '70crCAAYmNP1xLkKKM09zA' =>
          {
            'token' => 'k_csguHtnEMcXL6s-UmBBQ',
            'expiry' => 153_574_356_4
          }
      }
    end

    let(:user) { create(:user) }
    let(:password) { user.password }

    let(:params) do
      {
        email: user.email,
        password: password
      }
    end

    context 'login with well data' do
      it 'returns a successful response' do
        subject

        expect(response).to be_successful
      end

      it 'returns the user' do
        subject

        expect(json[:data][:email]).to eq(user.email)
        expect(json[:data][:gender]).to eq(user.gender)
        expect(json[:data][:provider]).to eq('email')
        expect(json[:data][:uid]).to eq(user.email)
      end

      it 'returns a valid acces token' do
        subject

        token = response.header['access-token']
        expect(token).to be_truthy
      end
    end

    context 'when credentials dont match' do
      let(:password) { 'invalid' }

      it 'does not return a successful response' do
        subject

        expect(response).to be_unauthorized
      end

      it 'returns message error' do
        subject

        expect(json[:errors][0]).to eq('Invalid login credentials. Please try again.')
      end
    end
  end
end
