# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  let(:email)                 { Faker::Internet.unique.email }
  let(:password)              { Faker::Internet.password(min_length: 8) }
  let(:gender)                { Faker::Gender.binary_type }

  let(:params) do
    { email: email, gender: gender, password: password, password_confirmation: password }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post '/api/v1', params: params
        end.to change(User, :count).by(1)
      end

      it 'successful response' do
        post '/api/v1', params: params, as: :json
        expect(response).to be_successful
      end

      it 'valid response with the params' do
        post '/api/v1', params: params, as: :json
        expect(json[:status]).to eq('success')
        expect(json[:data][:email]).to eq(email)
        expect(json[:data][:uid]).to eq(email)
        expect(json[:data][:gender]).to eq(gender)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          params[:email] = 'invalid'
          post '/api/v1', params: params
        end.to change(User, :count).by(0)
      end
    end
  end
end
