require 'rails_helper'

RSpec.describe 'API Post Tweet', type: :request do
  describe 'POST /api/tweets/tweet' do
    subject(:hit_api) { post '/api/tweets/tweet' }

    it 'should have ok status' do
      hit_api
      expect(response).to have_http_status :ok
    end
  end

end
