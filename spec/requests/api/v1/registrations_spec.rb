require 'rails_helper'

RSpec.describe 'Api::V1::Registrations', type: :request do
  let(:valid_attributes) do
    { email: 'test@test.com', gender: 'male', password: '123456', password_confirmation: '123456' }
  end

  let(:invalid_attributes) do
    { email: 'test@test.com', gender: 'male_bat', password: '123456', password_confirmation: '123456' }
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect {
          post '/api/v1', params: valid_attributes
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect {
          post '/api/v1', params: invalid_attributes
        }.to change(User, :count).by(0)
      end
    end
  end
end
