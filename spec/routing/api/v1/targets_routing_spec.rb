# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TargetsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/targets').to route_to('api/v1/targets#create', format: 'json')
    end

    it 'routes to #index' do
      expect(get: '/api/v1/targets').to route_to('api/v1/targets#index', format: 'json')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/targets/1').to route_to('api/v1/targets#destroy', format: 'json', id: '1')
    end
  end
end
