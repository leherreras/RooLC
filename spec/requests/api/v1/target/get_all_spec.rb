# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/topics', type: :request do
  subject { get api_v1_targets_url }
  let!(:targets) { create_list(:target, 3) }

  describe 'GET /index' do
    it 'how many targets' do
      subject
      expect(json.size).to eq(3)
    end

    it 'renders a successful response' do
      subject
      expect(response).to be_successful
    end
  end
end
