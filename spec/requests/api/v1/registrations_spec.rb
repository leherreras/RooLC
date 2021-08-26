# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  subject { post user_registration_path, params: params, as: :json }

  let(:user) { build(:user) }

  let(:params) do
    { email: user.email, gender: user.gender, password: user.password, password_confirmation: user.password }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'successful response' do
        subject
        expect(response).to be_successful
      end

      it 'valid response with the params' do
        subject
        expect(json[:status]).to eq('success')
        expect(json[:data][:email]).to eq(user.email)
        expect(json[:data][:uid]).to eq(user.email)
        expect(json[:data][:gender]).to eq(user.gender)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        params[:email] = 'invalid'
        subject
        expect { response }.to change(User, :count).by(0)
      end
    end
  end
end
