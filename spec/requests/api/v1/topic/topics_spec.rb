# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/topics', type: :request do
  let(:user) { create(:user) }
  let!(:topics) { create_list(:topic, 3) }

  subject { get api_v1_topics_url, headers: auth_headers, as: :json }

  describe 'GET /index' do
    it 'returns all topics' do
      subject
      expect(json.size).to eq(3)
    end

    it 'renders a successful response' do
      subject
      expect(response).to be_successful
    end
  end
end
