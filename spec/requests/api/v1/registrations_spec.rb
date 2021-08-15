# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  let(:email)                 { 'test@test.com' }
  let(:password)              { '123456' }
  let(:password_confirmation) { '123456' }
  let(:gender)                { 'male' }
  let(:gender_f)              { 'maleFake' }

  let(:valid_attributes) do
    { email: email, gender: gender, password: password, password_confirmation: password_confirmation }
  end

  let(:invalid_attributes) do
    { email: email, gender: gender_f, password: password, password_confirmation: password_confirmation }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post '/api/v1', params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'successful response' do
        post '/api/v1', params: valid_attributes, as: :json
        expect(response).to be_successful
      end

      it 'valid response with the params' do
        post '/api/v1', params: valid_attributes, as: :json
        expect(json[:status]).to eq('success')
        expect(json[:data][:email]).to eq(email)
        expect(json[:data][:uid]).to eq(email)
        expect(json[:data][:gender]).to eq(gender)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post '/api/v1', params: invalid_attributes
        end.to change(User, :count).by(0)
      end
    end
  end
end
