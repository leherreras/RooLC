require 'rails_helper'

RSpec.describe 'DELETE api/v1/users/sign_out', type: :request do
  describe 'DELETE session' do
    let(:user) { create(:user) }

    it 'logout a user' do
      # initial sign in to generate a token and response
      post user_session_path, params: {
        email: user.email,
        password: user.password
      }, as: :json

      expect(user.reload.tokens.count).to eq 1

      # sign out request using header values from sign in response
      delete destroy_user_session_path, params: {
        'access-token': response.header['access-token'],
        client: response.header['client'],
        uid: response.header['uid']
      }, as: :json

      expect(json['errors']).to be_blank
      expect(response).to be_ok
      # user token should be deleted following sign out
      expect(user.reload.tokens.count).to eq 0
    end
  end
end
