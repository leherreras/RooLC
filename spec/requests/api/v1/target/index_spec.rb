# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/topics', type: :request do
  subject { get api_v1_targets_url, headers: auth_headers, as: :json }

  let(:user) { create :user }
  let!(:targets) { create_list(:target, 3, user: user) }
  let!(:other_user_targets) { create_list(:target, 3) }

  after(:each) do
    restart_unique_generator
  end

  describe 'GET /index' do
    it 'how many targets' do
      subject
      expect(json.size).to eq(3)
    end

    it 'renders a successful response' do
      subject
      expect(response).to be_successful
    end

    it 'returns user targets' do
      subject
      expect(json.pluck([:id])).to match_array(targets.pluck([:id]))
    end

    it 'does not return other\'s users targets' do
      subject
      expect(json.pluck([:id])).not_to include(other_user_targets.pluck([:id]))
    end
  end
end
