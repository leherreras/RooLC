# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST api/v1/passwords/', type: :request do
  let!(:user) { create(:user) }
  let(:email) { user.email }

  let(:params) { { email: email } }

  subject { post user_password_path, params: params, as: :json }

  context 'with valid params' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'adds recover password email to queue' do
      expect { subject }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end

  context 'with invalid params' do
    let(:email) { 'bad@email.com' }

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:not_found)
    end

    it 'does not send an email' do
      expect { subject }.to_not change(ActionMailer::Base.deliveries, :count)
    end
  end
end
