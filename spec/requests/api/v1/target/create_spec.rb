# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/targets', type: :request do
  subject { post api_v1_targets_path, params: params, headers: auth_headers, as: :json }

  let(:user) { create(:user) }
  let(:topic) { create(:topic) }

  let(:target) { build(:target) }

  let(:params) do
    {
      target: {
        title: target.title,
        radius: target.radius,
        latitude: target.latitude,
        longitude: target.longitude,
        topic_id: topic.id
      }
    }
  end

  let(:target_created) { Target.last }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'returns a successful response' do
        subject

        expect(response).to be_successful
      end

      it 'creates a new Target' do
        expect { subject }.to change(Target, :count).by(1)
      end

      it 'assigns the correct user' do
        subject
        expect(target_created.user_id).to eq user.id
      end

      it 'assigns the correct topic' do
        subject
        expect(target_created.topic_id).to eq topic.id
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Target' do
        params[:topic_id] = nil
        subject

        expect { request }.to change(Target, :count).by(0)
      end
    end
  end
end
